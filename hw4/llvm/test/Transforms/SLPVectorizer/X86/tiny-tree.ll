target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"
; RUN: opt < %s -basicaa -slp-vectorizer -S -mtriple=x86_64-apple-macosx10.8.0 -mcpu=corei7 | FileCheck %s


; CHECK: tiny_tree_fully_vectorizable
; CHECK: load <2 x double>
; CHECK: store <2 x double>
; CHECK: ret 

define void @tiny_tree_fully_vectorizable(double* noalias nocapture %dst, double* noalias nocapture readonly %src, i64 %count) #0 {
entry:
  %cmp12 = icmp eq i64 %count, 0
  br i1 %cmp12, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.015 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %dst.addr.014 = phi double* [ %add.ptr4, %for.body ], [ %dst, %entry ]
  %src.addr.013 = phi double* [ %add.ptr, %for.body ], [ %src, %entry ]
  %0 = load double* %src.addr.013, align 8
  store double %0, double* %dst.addr.014, align 8
  %arrayidx2 = getelementptr inbounds double* %src.addr.013, i64 1
  %1 = load double* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds double* %dst.addr.014, i64 1
  store double %1, double* %arrayidx3, align 8
  %add.ptr = getelementptr inbounds double* %src.addr.013, i64 %i.015
  %add.ptr4 = getelementptr inbounds double* %dst.addr.014, i64 %i.015
  %inc = add i64 %i.015, 1
  %exitcond = icmp eq i64 %inc, %count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; CHECK: tiny_tree_fully_vectorizable2
; CHECK: load <4 x float>
; CHECK: store <4 x float>
; CHECK: ret

define void @tiny_tree_fully_vectorizable2(float* noalias nocapture %dst, float* noalias nocapture readonly %src, i64 %count) #0 {
entry:
  %cmp20 = icmp eq i64 %count, 0
  br i1 %cmp20, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.023 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %dst.addr.022 = phi float* [ %add.ptr8, %for.body ], [ %dst, %entry ]
  %src.addr.021 = phi float* [ %add.ptr, %for.body ], [ %src, %entry ]
  %0 = load float* %src.addr.021, align 4
  store float %0, float* %dst.addr.022, align 4
  %arrayidx2 = getelementptr inbounds float* %src.addr.021, i64 1
  %1 = load float* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds float* %dst.addr.022, i64 1
  store float %1, float* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds float* %src.addr.021, i64 2
  %2 = load float* %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds float* %dst.addr.022, i64 2
  store float %2, float* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds float* %src.addr.021, i64 3
  %3 = load float* %arrayidx6, align 4
  %arrayidx7 = getelementptr inbounds float* %dst.addr.022, i64 3
  store float %3, float* %arrayidx7, align 4
  %add.ptr = getelementptr inbounds float* %src.addr.021, i64 %i.023
  %add.ptr8 = getelementptr inbounds float* %dst.addr.022, i64 %i.023
  %inc = add i64 %i.023, 1
  %exitcond = icmp eq i64 %inc, %count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; We do not vectorize the tiny tree which is not fully vectorizable. 
; CHECK: tiny_tree_not_fully_vectorizable
; CHECK-NOT: <2 x double>
; CHECK: ret 

define void @tiny_tree_not_fully_vectorizable(double* noalias nocapture %dst, double* noalias nocapture readonly %src, i64 %count) #0 {
entry:
  %cmp12 = icmp eq i64 %count, 0
  br i1 %cmp12, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.015 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %dst.addr.014 = phi double* [ %add.ptr4, %for.body ], [ %dst, %entry ]
  %src.addr.013 = phi double* [ %add.ptr, %for.body ], [ %src, %entry ]
  %0 = load double* %src.addr.013, align 8
  store double %0, double* %dst.addr.014, align 8
  %arrayidx2 = getelementptr inbounds double* %src.addr.013, i64 2
  %1 = load double* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds double* %dst.addr.014, i64 1 
  store double %1, double* %arrayidx3, align 8
  %add.ptr = getelementptr inbounds double* %src.addr.013, i64 %i.015
  %add.ptr4 = getelementptr inbounds double* %dst.addr.014, i64 %i.015
  %inc = add i64 %i.015, 1
  %exitcond = icmp eq i64 %inc, %count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}


; CHECK: tiny_tree_not_fully_vectorizable2
; CHECK-NOT: <2 x double>
; CHECK: ret

define void @tiny_tree_not_fully_vectorizable2(float* noalias nocapture %dst, float* noalias nocapture readonly %src, i64 %count) #0 {
entry:
  %cmp20 = icmp eq i64 %count, 0
  br i1 %cmp20, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.023 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %dst.addr.022 = phi float* [ %add.ptr8, %for.body ], [ %dst, %entry ]
  %src.addr.021 = phi float* [ %add.ptr, %for.body ], [ %src, %entry ]
  %0 = load float* %src.addr.021, align 4
  store float %0, float* %dst.addr.022, align 4
  %arrayidx2 = getelementptr inbounds float* %src.addr.021, i64 4 
  %1 = load float* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds float* %dst.addr.022, i64 1
  store float %1, float* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds float* %src.addr.021, i64 2
  %2 = load float* %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds float* %dst.addr.022, i64 2
  store float %2, float* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds float* %src.addr.021, i64 3
  %3 = load float* %arrayidx6, align 4
  %arrayidx7 = getelementptr inbounds float* %dst.addr.022, i64 3
  store float %3, float* %arrayidx7, align 4
  %add.ptr = getelementptr inbounds float* %src.addr.021, i64 %i.023
  %add.ptr8 = getelementptr inbounds float* %dst.addr.022, i64 %i.023
  %inc = add i64 %i.023, 1
  %exitcond = icmp eq i64 %inc, %count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}
