//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
//
//   fxc /T cs_4_0 /Fo TessellatorCS40_TessellateIndicesCS.o /Fc
//    TessellatorCS40_TessellateIndicesCS.asm
//    TessellatorCS40_TessellateIndicesCS.hlsl /E CSTessellationIndices
//
//
// Buffer Definitions: 
//
// cbuffer cbNeverChanges
// {
//
//   uint4 insidePointIndex[90];        // Offset:    0 Size:  1440
//   uint4 outsidePointIndex[90];       // Offset: 1440 Size:  1440
//
// }
//
// cbuffer cbCS
// {
//
//   uint4 g_param;                     // Offset:    0 Size:    16
//
// }
//
// Resource bind info for InputTriIDIndexID
// {
//
//   uint2 $Element;                    // Offset:    0 Size:     8
//
// }
//
// Resource bind info for InputEdgeFactor
// {
//
//   float4 $Element;                   // Offset:    0 Size:    16
//
// }
//
// Resource bind info for InputScanned
// {
//
//   uint2 $Element;                    // Offset:    0 Size:     8
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// InputTriIDIndexID                 texture  struct         r/o    0        1
// InputEdgeFactor                   texture  struct         r/o    1        1
// InputScanned                      texture  struct         r/o    2        1
// TessedIndicesOut                      UAV    byte         r/w    0        1
// cbNeverChanges                    cbuffer      NA          NA    0        1
// cbCS                              cbuffer      NA          NA    1        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// no Input
//
// Output signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// no Output
cs_4_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer cb0[180], dynamicIndexed
dcl_constantbuffer cb1[1], immediateIndexed
dcl_resource_structured t0, 8 
dcl_resource_structured t1, 16 
dcl_resource_structured t2, 8 
dcl_uav_raw u0
dcl_input vThreadID.x
dcl_temps 11
dcl_thread_group 128, 1, 1
ult r0.x, vThreadID.x, cb1[0].x
if_nz r0.x
  ld_structured r0.xy, vThreadID.x, l(0), t0.xyxx
  iadd r0.z, r0.x, l(-1)
  ld_structured r1.x, r0.z, l(0), t2.xxxx
  ld_structured r2.xyzw, r0.x, l(0), t1.xyzw
  ge r0.xzw, l(0.000000, 0.000000, 0.000000, 0.000000), r2.xxyz
  or r0.x, r0.z, r0.x
  or r0.x, r0.w, r0.x
  if_z r0.x
    max r2.xyzw, r2.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
    min r2.xyzw, r2.xyzw, l(64.000000, 64.000000, 64.000000, 64.000000)
    and r3.xyzw, r2.xyzw, l(0x007fffff, 0x007fffff, 0x007fffff, 0x007fffff)
    and r4.xyzw, r2.xyzw, l(0x7f800000, 0x7f800000, 0x7f800000, 0x7f800000)
    iadd r4.xyzw, r4.xyzw, l(0x00800000, 0x00800000, 0x00800000, 0x00800000)
    movc r2.xyzw, r3.xyzw, r4.xyzw, r2.xyzw
    ftou r3.xyzw, r2.xyzw
    and r3.xyzw, r3.xyzw, l(1, 1, 1, 1)
    ine r0.x, r3.w, l(0)
    ieq r0.x, r0.x, l(0)
    movc r3.xyz, r3.xyzx, l(1,1,1,0), l(0,0,0,0)
    eq r4.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r2.wxyz
    or r0.x, r0.x, r4.x
    movc r3.w, r0.x, l(0), l(1)
    and r0.z, r4.z, r4.y
    and r0.z, r4.w, r0.z
    and r0.z, r4.x, r0.z
    if_z r0.z
      mul r4.xyzw, r2.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000)
      ieq r5.xyzw, l(1, 1, 1, 1), r3.xyzw
      and r6.xyzw, r5.xyzw, l(1, 1, 1, 1)
      eq r7.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r2.xyzw
      and r7.xyzw, r7.xyzw, l(1, 1, 1, 1)
      or r6.xyzw, r6.xyzw, r7.xyzw
      itof r6.xyzw, r6.xyzw
      mad r6.xyzw, r6.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r4.xyzw
      mad r2.xyzw, r2.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), l(0.500000, 0.500000, 0.500000, 0.500000)
      round_pi r2.xyzw, r2.xyzw
      ftou r2.xyzw, r2.xyzw
      ishl r2.xyzw, r2.xyzw, l(1)
      round_pi r4.xyzw, r4.xyzw
      ftou r4.xyzw, r4.xyzw
      ishl r4.xyzw, r4.xyzw, l(1)
      iadd r4.xyzw, r4.xyzw, l(1, 1, 1, 1)
      movc r2.xyzw, r5.xyzw, r2.xyzw, r4.xyzw
      iadd r0.w, r2.x, r2.y
      iadd r0.w, r0.w, r2.z
      iadd r0.w, r0.w, l(-3)
      movc r1.y, r0.x, l(3), l(4)
      umax r2.w, r2.w, r1.y
      ushr r1.y, r2.w, l(1)
      iadd r1.z, r1.y, l(-1)
      imul null, r1.w, r1.z, r1.y
      imad r1.y, r1.z, r1.y, -r1.z
      imul null, r1.y, l(3), r1.y
      imad r1.z, l(3), r1.w, l(1)
      movc r0.x, r0.x, r1.z, r1.y
      iadd r0.x, r0.w, r0.x
    else 
      and r0.x, r0.z, l(3)
      mov r6.xyzw, l(0,0,0,0)
      mov r2.xyzw, l(0,0,0,0)
      mov r0.w, l(0)
    endif 
  else 
    mov r6.xyzw, l(0,0,0,0)
    mov r2.xyzw, l(0,0,0,0)
    mov r3.xyzw, l(0,0,0,0)
    mov r0.xw, l(0,0,0,0)
  endif 
  ieq r0.x, l(3), r0.x
  if_nz r0.x
    ult r0.x, r0.y, l(3)
    iadd r0.z, r1.x, r0.y
    movc r0.x, r0.x, r0.z, l(-1)
  else 
    round_pi r4.xyzw, r6.xyzw
    ftoi r4.xyzw, r4.xyzw
    ieq r5.xyzw, l(1, 1, 1, 1), r3.xyzw
    iadd r5.xyzw, r4.xyzw, r5.xyzw
    imul null, r1.yz, r5.wwxw, l(0, 10, 10, 0)
    ishl r0.z, cb0[r1.y + 9].y, l(3)
    ishl r1.y, cb0[r1.z + 99].y, l(3)
    iadd r1.y, r0.z, r1.y
    ine r1.z, r3.w, r3.x
    ieq r1.w, r3.w, l(1)
    or r1.z, r1.w, r1.z
    ieq r5.x, r3.w, r3.x
    iadd r6.xy, r1.yyyy, l(5, 4, 0, 0)
    movc r5.w, r5.x, r6.x, r6.y
    movc r1.y, r1.z, r5.w, r1.y
    ult r5.w, r0.y, r1.y
    if_nz r5.w
      ieq r6.xy, l(1, 1, 0, 0), r3.xwxx
      iadd r6.xy, r4.xwxx, r6.xyxx
      imul null, r6.zw, r6.xxxy, l(0, 0, 10, 10)
      mov r7.y, cb0[r6.z + 99].y
      mov r7.x, cb0[r6.w + 9].y
      ishl r7.xy, r7.xyxx, l(2)
      ult r3.x, r0.y, r7.x
      if_nz r3.x
        ushr r3.x, r0.y, l(2)
        and r4.x, r0.y, l(-4)
        iadd r4.x, r0.y, -r4.x
        imad r3.x, r6.y, l(10), r3.x
        ieq r7.zw, l(0, 0, 0, 2), r4.xxxx
        or r5.w, r7.w, r7.z
        if_nz r5.w
          imad r5.w, r6.y, l(10), cb0[r3.x + 0].z
          iadd r5.w, r0.w, cb0[r5.w + 0].y
          ushr r7.z, r4.x, l(1)
          iadd r5.w, r5.w, r7.z
        else 
          ieq r4.x, l(1), r4.x
          if_nz r4.x
            imad r3.x, r6.x, l(10), cb0[r3.x + 0].z
            mov r5.w, cb0[r3.x + 90].y
          else 
            mov r5.w, l(-1)
          endif 
        endif 
      else 
        iadd r3.x, r0.y, -r7.x
        ult r4.x, r3.x, r7.y
        if_nz r4.x
          ushr r4.x, r3.x, l(2)
          and r7.z, r3.x, l(-4)
          iadd r7.z, r3.x, -r7.z
          imad r4.x, r6.x, l(10), r4.x
          ult r7.w, r7.z, l(2)
          if_nz r7.w
            imad r7.w, r6.x, l(10), cb0[r4.x + 90].z
            iadd r5.w, cb0[r7.w + 90].y, r7.z
          else 
            ieq r7.z, r7.z, l(2)
            if_nz r7.z
              imad r4.x, r6.y, l(10), cb0[r4.x + 90].z
              iadd r7.z, r0.w, cb0[r4.x + 0].y
              iadd r7.w, r7.z, l(1)
              movc r5.w, cb0[r4.x + 0].x, r7.w, r7.z
            else 
              mov r5.w, l(-1)
            endif 
          endif 
        else 
          movc r8.xyz, r3.wwww, l(0,1,4,0), l(1,0,4,0)
          movc r8.xyz, r5.xxxx, l(1,1,5,0), r8.xyzx
          and r8.xyz, r1.zzzz, r8.xyzx
          iadd r1.z, r3.x, -r7.y
          ult r3.x, r1.z, r8.z
          if_nz r3.x
            if_nz r5.x
              ieq r9.xyzw, l(0, 2, 1, 3), r1.zzzz
              ushr r7.zw, r7.xxxy, l(2)
              iadd r3.x, r0.w, r7.z
              and r10.xy, r9.ywyy, l(1, 1, 0, 0)
              iadd r3.x, r3.x, r10.x
              or r9.xy, r9.ywyy, r9.xzxx
              iadd r4.x, r7.w, r10.y
              movc r4.x, r9.y, r4.x, l(-1)
              movc r5.w, r9.x, r3.x, r4.x
            else 
              ushr r7.zw, r7.xxxy, l(2)
              iadd r3.x, r0.w, r7.z
              ult r4.x, r1.z, l(3)
              iadd r5.x, r7.w, r1.z
              iadd r5.x, r5.x, l(-1)
              movc r4.x, r4.x, r5.x, l(-1)
              movc r4.x, r1.z, r4.x, r3.x
              ieq r9.xyz, l(0, 2, 1, 0), r1.zzzz
              or r5.x, r9.y, r9.x
              and r7.z, r9.y, l(1)
              iadd r3.x, r3.x, r7.z
              movc r7.z, r9.z, r7.w, l(-1)
              movc r3.x, r5.x, r3.x, r7.z
              movc r5.w, r3.w, r3.x, r4.x
            endif 
          else 
            iadd r1.z, r1.z, -r8.z
            ult r3.x, r1.z, r7.y
            if_nz r3.x
              ushr r3.x, r1.z, l(2)
              and r4.x, r1.z, l(-4)
              iadd r4.x, r1.z, -r4.x
              imad r3.x, r6.x, l(10), r3.x
              ult r5.x, r4.x, l(2)
              if_nz r5.x
                ushr r5.x, r7.y, l(2)
                iadd r5.x, r5.x, r8.x
                imad r7.z, r6.x, l(10), cb0[r3.x + 90].z
                iadd r7.z, l(1), r7.z
                iadd r7.z, cb0[r6.z + 99].y, -cb0[r7.z + 90].y
                iadd r5.x, r5.x, r7.z
                iadd r5.w, r5.x, r4.x
              else 
                ieq r4.x, r4.x, l(2)
                if_nz r4.x
                  ushr r4.x, r7.x, l(2)
                  iadd r4.x, r0.w, r4.x
                  iadd r4.x, r4.x, r8.y
                  imad r3.x, r6.y, l(10), cb0[r3.x + 90].z
                  iadd r3.x, l(1), r3.x
                  iadd r3.x, cb0[r6.w + 9].y, -cb0[r3.x + 0].y
                  iadd r5.w, r4.x, r3.x
                else 
                  mov r5.w, l(-1)
                endif 
              endif 
            else 
              iadd r1.z, r1.z, -r7.y
              ushr r3.x, r1.z, l(2)
              and r4.x, r1.z, l(-4)
              iadd r1.z, r1.z, -r4.x
              imad r3.x, r6.y, l(10), r3.x
              ieq r7.zw, l(0, 0, 0, 2), r1.zzzz
              or r4.x, r7.w, r7.z
              if_nz r4.x
                ushr r4.x, r7.x, l(2)
                iadd r4.x, r0.w, r4.x
                iadd r4.x, r4.x, r8.y
                imad r5.x, r6.y, l(10), cb0[r3.x + 0].w
                iadd r5.x, l(1), r5.x
                iadd r5.x, cb0[r6.w + 9].y, -cb0[r5.x + 0].y
                iadd r4.x, r4.x, r5.x
                and r5.x, r7.w, l(1)
                iadd r5.w, r4.x, r5.x
              else 
                ieq r1.z, l(1), r1.z
                if_nz r1.z
                  ushr r1.z, r7.y, l(2)
                  iadd r1.z, r1.z, r8.x
                  imad r4.x, r6.x, l(10), cb0[r3.x + 0].w
                  iadd r4.x, l(1), r4.x
                  iadd r4.x, cb0[r6.z + 99].y, -cb0[r4.x + 90].y
                  iadd r1.z, r1.z, r4.x
                  imad r3.x, r6.x, l(10), cb0[r3.x + 0].w
                  iadd r4.x, r1.z, l(1)
                  movc r5.w, cb0[r3.x + 90].x, r4.x, r1.z
                else 
                  mov r5.w, l(-1)
                endif 
              endif 
            endif 
          endif 
        endif 
      endif 
      ine r1.z, r5.w, l(-1)
      iadd r3.x, r1.x, r5.w
      movc r0.x, r1.z, r3.x, l(-1)
    else 
      imul null, r1.z, r5.y, l(10)
      ishl r1.z, cb0[r1.z + 99].y, l(3)
      iadd r1.z, r0.z, r1.z
      ine r3.x, r3.w, r3.y
      or r3.x, r1.w, r3.x
      ieq r4.x, r3.w, r3.y
      iadd r5.xy, r1.zzzz, l(5, 4, 0, 0)
      movc r5.x, r4.x, r5.x, r5.y
      movc r1.z, r3.x, r5.x, r1.z
      iadd r1.z, r1.z, r1.y
      ult r5.x, r0.y, r1.z
      if_nz r5.x
        iadd r5.x, r2.w, r0.w
        iadd r5.y, r2.x, l(-1)
        iadd r5.x, r5.x, l(-3)
        iadd r1.y, r0.y, -r1.y
        ieq r6.xy, l(1, 1, 0, 0), r3.ywyy
        iadd r6.xy, r4.ywyy, r6.xyxx
        imul null, r6.zw, r6.xxxy, l(0, 0, 10, 10)
        mov r7.y, cb0[r6.z + 99].y
        mov r7.x, cb0[r6.w + 9].y
        ishl r7.xy, r7.xyxx, l(2)
        ult r3.y, r1.y, r7.x
        if_nz r3.y
          ushr r3.y, r1.y, l(2)
          and r4.y, r1.y, l(-4)
          iadd r4.y, r1.y, -r4.y
          imad r3.y, r6.y, l(10), r3.y
          ieq r7.zw, l(0, 0, 0, 2), r4.yyyy
          or r5.w, r7.w, r7.z
          if_nz r5.w
            imad r5.w, r6.y, l(10), cb0[r3.y + 0].z
            iadd r5.w, r5.x, cb0[r5.w + 0].y
            ushr r7.z, r4.y, l(1)
            iadd r5.w, r5.w, r7.z
          else 
            ieq r4.y, l(1), r4.y
            if_nz r4.y
              imad r3.y, r6.x, l(10), cb0[r3.y + 0].z
              iadd r5.w, r5.y, cb0[r3.y + 90].y
            else 
              mov r5.w, l(-1)
            endif 
          endif 
        else 
          iadd r1.y, r1.y, -r7.x
          ult r3.y, r1.y, r7.y
          if_nz r3.y
            ushr r3.y, r1.y, l(2)
            and r4.y, r1.y, l(-4)
            iadd r4.y, r1.y, -r4.y
            imad r3.y, r6.x, l(10), r3.y
            ult r7.z, r4.y, l(2)
            if_nz r7.z
              imad r7.z, r6.x, l(10), cb0[r3.y + 90].z
              iadd r7.z, r5.y, cb0[r7.z + 90].y
              iadd r5.w, r7.z, r4.y
            else 
              ieq r4.y, r4.y, l(2)
              if_nz r4.y
                imad r3.y, r6.y, l(10), cb0[r3.y + 90].z
                iadd r4.y, r5.x, cb0[r3.y + 0].y
                iadd r7.z, r4.y, l(1)
                movc r5.w, cb0[r3.y + 0].x, r7.z, r4.y
              else 
                mov r5.w, l(-1)
              endif 
            endif 
          else 
            movc r8.xyz, r3.wwww, l(0,1,4,0), l(1,0,4,0)
            movc r8.xyz, r4.xxxx, l(1,1,5,0), r8.xyzx
            and r8.xyz, r3.xxxx, r8.xyzx
            iadd r1.y, r1.y, -r7.y
            ult r3.x, r1.y, r8.z
            if_nz r3.x
              if_nz r4.x
                ieq r9.xyzw, l(0, 2, 1, 3), r1.yyyy
                ushr r3.xy, r7.xyxx, l(2)
                iadd r3.xy, r5.xyxx, r3.xyxx
                and r4.xy, r9.ywyy, l(1, 1, 0, 0)
                or r7.zw, r9.yyyw, r9.xxxz
                iadd r3.xy, r3.xyxx, r4.xyxx
                movc r3.y, r7.w, r3.y, l(-1)
                movc r5.w, r7.z, r3.x, r3.y
              else 
                ushr r3.xy, r7.xyxx, l(2)
                ult r4.x, r1.y, l(3)
                iadd r3.xy, r5.xyxx, r3.xyxx
                iadd r4.y, r3.y, r1.y
                iadd r4.y, r4.y, l(-1)
                movc r4.x, r4.x, r4.y, l(-1)
                movc r4.x, r1.y, r4.x, r3.x
                ieq r9.xyz, l(0, 2, 1, 0), r1.yyyy
                or r4.y, r9.y, r9.x
                and r7.z, r9.y, l(1)
                iadd r3.x, r3.x, r7.z
                movc r3.y, r9.z, r3.y, l(-1)
                movc r3.x, r4.y, r3.x, r3.y
                movc r5.w, r3.w, r3.x, r4.x
              endif 
            else 
              iadd r1.y, r1.y, -r8.z
              ult r3.x, r1.y, r7.y
              if_nz r3.x
                ushr r3.x, r1.y, l(2)
                and r3.y, r1.y, l(-4)
                iadd r3.y, r1.y, -r3.y
                imad r3.x, r6.x, l(10), r3.x
                ult r4.x, r3.y, l(2)
                if_nz r4.x
                  ushr r4.x, r7.y, l(2)
                  iadd r4.x, r5.y, r4.x
                  iadd r4.x, r4.x, r8.x
                  imad r4.y, r6.x, l(10), cb0[r3.x + 90].z
                  iadd r4.y, l(1), r4.y
                  iadd r4.y, cb0[r6.z + 99].y, -cb0[r4.y + 90].y
                  iadd r4.x, r4.x, r4.y
                  iadd r5.w, r4.x, r3.y
                else 
                  ieq r3.y, r3.y, l(2)
                  if_nz r3.y
                    ushr r3.y, r7.x, l(2)
                    iadd r3.y, r5.x, r3.y
                    iadd r3.y, r3.y, r8.y
                    imad r3.x, r6.y, l(10), cb0[r3.x + 90].z
                    iadd r3.x, l(1), r3.x
                    iadd r3.x, cb0[r6.w + 9].y, -cb0[r3.x + 0].y
                    iadd r5.w, r3.y, r3.x
                  else 
                    mov r5.w, l(-1)
                  endif 
                endif 
              else 
                iadd r1.y, r1.y, -r7.y
                ushr r3.x, r1.y, l(2)
                and r3.y, r1.y, l(-4)
                iadd r1.y, r1.y, -r3.y
                imad r3.x, r6.y, l(10), r3.x
                ieq r4.xy, l(0, 2, 0, 0), r1.yyyy
                or r3.y, r4.y, r4.x
                if_nz r3.y
                  ushr r3.y, r7.x, l(2)
                  iadd r3.y, r5.x, r3.y
                  iadd r3.y, r3.y, r8.y
                  imad r4.x, r6.y, l(10), cb0[r3.x + 0].w
                  iadd r4.x, l(1), r4.x
                  iadd r4.x, cb0[r6.w + 9].y, -cb0[r4.x + 0].y
                  iadd r3.y, r3.y, r4.x
                  and r4.x, r4.y, l(1)
                  iadd r5.w, r3.y, r4.x
                else 
                  ieq r1.y, l(1), r1.y
                  if_nz r1.y
                    ushr r1.y, r7.y, l(2)
                    iadd r1.y, r5.y, r1.y
                    iadd r1.y, r1.y, r8.x
                    imad r3.y, r6.x, l(10), cb0[r3.x + 0].w
                    iadd r3.y, l(1), r3.y
                    iadd r3.y, cb0[r6.z + 99].y, -cb0[r3.y + 90].y
                    iadd r1.y, r1.y, r3.y
                    imad r3.x, r6.x, l(10), cb0[r3.x + 0].w
                    iadd r3.y, r1.y, l(1)
                    movc r5.w, cb0[r3.x + 90].x, r3.y, r1.y
                  else 
                    mov r5.w, l(-1)
                  endif 
                endif 
              endif 
            endif 
          endif 
        endif 
        ine r1.y, r5.w, l(-1)
        iadd r3.x, r1.x, r5.w
        movc r0.x, r1.y, r3.x, l(-1)
      else 
        imul null, r1.y, r5.z, l(10)
        ishl r1.y, cb0[r1.y + 99].y, l(3)
        iadd r0.z, r0.z, r1.y
        ine r1.y, r3.w, r3.z
        or r1.y, r1.w, r1.y
        ieq r3.x, r3.w, r3.z
        iadd r4.xy, r0.zzzz, l(5, 4, 0, 0)
        movc r3.y, r3.x, r4.x, r4.y
        movc r0.z, r1.y, r3.y, r0.z
        iadd r0.z, r0.z, r1.z
        ult r3.y, r0.y, r0.z
        if_nz r3.y
          iadd r4.xy, r2.wwww, l(-2, -3, 0, 0)
          ishl r3.y, r4.y, l(1)
          iadd r3.y, r0.w, r3.y
          iadd r2.x, r2.x, r2.y
          iadd r2.x, r2.x, l(-2)
          iadd r2.x, r2.x, -r4.x
          iadd r2.y, r4.x, r2.z
          iadd r2.y, r2.y, l(-1)
          iadd r1.z, r0.y, -r1.z
          ieq r5.xy, l(1, 1, 0, 0), r3.zwzz
          iadd r4.zw, r4.zzzw, r5.xxxy
          imul null, r5.xy, r4.zwzz, l(10, 10, 0, 0)
          mov r6.y, cb0[r5.x + 99].y
          mov r6.x, cb0[r5.y + 9].y
          ishl r5.zw, r6.xxxy, l(2)
          ult r2.z, r1.z, r5.z
          if_nz r2.z
            ushr r2.z, r1.z, l(2)
            and r3.z, r1.z, l(-4)
            iadd r3.z, r1.z, -r3.z
            imad r2.z, r4.w, l(10), r2.z
            ieq r6.xy, l(0, 2, 0, 0), r3.zzzz
            or r6.x, r6.y, r6.x
            if_nz r6.x
              imad r6.x, r4.w, l(10), cb0[r2.z + 0].z
              ushr r6.y, r3.z, l(1)
              iadd r6.x, cb0[r6.x + 0].y, r6.y
            else 
              ieq r3.z, l(1), r3.z
              if_nz r3.z
                imad r2.z, r4.z, l(10), cb0[r2.z + 0].z
                iadd r6.x, r4.x, cb0[r2.z + 90].y
              else 
                mov r6.x, l(-1)
              endif 
            endif 
          else 
            iadd r1.z, r1.z, -r5.z
            ult r2.z, r1.z, r5.w
            if_nz r2.z
              ushr r2.z, r1.z, l(2)
              and r3.z, r1.z, l(-4)
              iadd r3.z, r1.z, -r3.z
              imad r2.z, r4.z, l(10), r2.z
              ult r6.y, r3.z, l(2)
              if_nz r6.y
                imad r6.y, r4.z, l(10), cb0[r2.z + 90].z
                iadd r6.y, r4.x, cb0[r6.y + 90].y
                iadd r6.x, r6.y, r3.z
              else 
                ieq r3.z, r3.z, l(2)
                if_nz r3.z
                  imad r2.z, r4.w, l(10), cb0[r2.z + 90].z
                  iadd r3.z, cb0[r2.z + 0].y, l(1)
                  movc r6.x, cb0[r2.z + 0].x, r3.z, cb0[r2.z + 0].y
                else 
                  mov r6.x, l(-1)
                endif 
              endif 
            else 
              movc r6.yzw, r3.wwww, l(0,0,1,4), l(0,1,0,4)
              movc r6.yzw, r3.xxxx, l(0,1,1,5), r6.yyzw
              and r6.yzw, r1.yyyy, r6.yyzw
              iadd r1.y, r1.z, -r5.w
              ult r1.z, r1.y, r6.w
              if_nz r1.z
                if_nz r3.x
                  ieq r7.xyzw, l(0, 2, 1, 3), r1.yyyy
                  ushr r3.xz, r5.zzwz, l(2)
                  and r8.xy, r7.ywyy, l(1, 1, 0, 0)
                  iadd r1.z, r3.x, r8.x
                  or r7.xy, r7.ywyy, r7.xzxx
                  iadd r2.z, r4.x, r3.z
                  iadd r2.z, r2.z, r8.y
                  movc r2.z, r7.y, r2.z, l(-1)
                  movc r6.x, r7.x, r1.z, r2.z
                else 
                  ult r1.z, r1.y, l(3)
                  ushr r3.xz, r5.zzwz, l(2)
                  iadd r2.z, r4.x, r3.z
                  iadd r3.z, r2.z, r1.y
                  iadd r3.z, r3.z, l(-1)
                  movc r1.z, r1.z, r3.z, l(-1)
                  movc r1.z, r1.y, r1.z, r3.x
                  ieq r7.xyz, l(0, 2, 1, 0), r1.yyyy
                  or r3.z, r7.y, r7.x
                  and r7.x, r7.y, l(1)
                  iadd r3.x, r3.x, r7.x
                  movc r2.z, r7.z, r2.z, l(-1)
                  movc r2.z, r3.z, r3.x, r2.z
                  movc r6.x, r3.w, r2.z, r1.z
                endif 
              else 
                iadd r1.y, r1.y, -r6.w
                ult r1.z, r1.y, r5.w
                if_nz r1.z
                  ushr r1.z, r1.y, l(2)
                  and r2.z, r1.y, l(-4)
                  iadd r2.z, r1.y, -r2.z
                  imad r1.z, r4.z, l(10), r1.z
                  ult r3.x, r2.z, l(2)
                  if_nz r3.x
                    ushr r3.x, r5.w, l(2)
                    iadd r3.x, r4.x, r3.x
                    iadd r3.x, r3.x, r6.y
                    imad r3.z, r4.z, l(10), cb0[r1.z + 90].z
                    iadd r3.z, l(1), r3.z
                    iadd r3.z, cb0[r5.x + 99].y, -cb0[r3.z + 90].y
                    iadd r3.x, r3.x, r3.z
                    iadd r6.x, r3.x, r2.z
                  else 
                    ieq r2.z, r2.z, l(2)
                    if_nz r2.z
                      ushr r2.z, r5.z, l(2)
                      iadd r2.z, r2.z, r6.z
                      imad r1.z, r4.w, l(10), cb0[r1.z + 90].z
                      iadd r1.z, l(1), r1.z
                      iadd r1.z, cb0[r5.y + 9].y, -cb0[r1.z + 0].y
                      iadd r6.x, r2.z, r1.z
                    else 
                      mov r6.x, l(-1)
                    endif 
                  endif 
                else 
                  iadd r1.y, r1.y, -r5.w
                  ushr r1.z, r1.y, l(2)
                  and r2.z, r1.y, l(-4)
                  iadd r1.y, r1.y, -r2.z
                  imad r1.z, r4.w, l(10), r1.z
                  ieq r3.xz, l(0, 0, 2, 0), r1.yyyy
                  or r2.z, r3.z, r3.x
                  if_nz r2.z
                    ushr r2.z, r5.z, l(2)
                    iadd r2.z, r2.z, r6.z
                    imad r3.x, r4.w, l(10), cb0[r1.z + 0].w
                    iadd r3.x, l(1), r3.x
                    iadd r3.x, cb0[r5.y + 9].y, -cb0[r3.x + 0].y
                    iadd r2.z, r2.z, r3.x
                    and r3.x, r3.z, l(1)
                    iadd r6.x, r2.z, r3.x
                  else 
                    ieq r1.y, l(1), r1.y
                    if_nz r1.y
                      ushr r1.y, r5.w, l(2)
                      iadd r1.y, r4.x, r1.y
                      iadd r1.y, r1.y, r6.y
                      imad r2.z, r4.z, l(10), cb0[r1.z + 0].w
                      iadd r2.z, l(1), r2.z
                      iadd r2.z, cb0[r5.x + 99].y, -cb0[r2.z + 90].y
                      iadd r1.y, r1.y, r2.z
                      imad r1.z, r4.z, l(10), cb0[r1.z + 0].w
                      iadd r2.z, r1.y, l(1)
                      movc r6.x, cb0[r1.z + 90].x, r2.z, r1.y
                    else 
                      mov r6.x, l(-1)
                    endif 
                  endif 
                endif 
              endif 
            endif 
          endif 
          ine r1.y, r6.x, l(-1)
          ige r1.z, r6.x, r4.x
          ieq r2.y, r6.x, r2.y
          iadd r2.x, r6.x, r2.x
          movc r2.x, r2.y, l(0), r2.x
          ieq r2.y, r6.x, r4.y
          iadd r2.z, r6.x, r3.y
          movc r2.y, r2.y, r0.w, r2.z
          movc r1.z, r1.z, r2.x, r2.y
          iadd r1.z, r1.x, r1.z
          movc r0.x, r1.y, r1.z, l(-1)
        else 
          iadd r1.y, r2.w, l(1)
          ushr r1.z, r1.y, l(1)
          iadd r2.xy, r1.zzzz, l(-1, -2, 0, 0)
          ishl r2.z, r2.y, l(3)
          ishl r3.x, r2.w, l(1)
          iadd r3.y, r3.x, l(1)
          imad r2.x, l(-2), r2.x, r3.y
          imad r2.x, r2.x, r2.y, r2.z
          imad r2.x, r2.x, l(3), r0.z
          iadd r2.z, r2.x, l(4)
          movc r2.x, r1.w, r2.z, r2.x
          iadd r2.z, r2.x, l(-4)
          uge r2.z, r0.y, r2.z
          and r1.w, r1.w, r2.z
          if_nz r1.w
            iadd r1.y, -r1.z, r1.y
            iadd r1.y, l(-1), r1.y
            imul null, r1.y, r1.y, r2.y
            imad r1.y, r1.y, l(3), r0.w
            iadd r1.z, -r2.x, l(4)
            iadd r1.w, r0.y, r1.z
            ine r1.w, r1.w, l(3)
            iadd r1.y, r1.y, r0.y
            iadd r1.y, r1.y, r1.z
            iadd r1.y, r1.x, r1.y
            movc r0.x, r1.w, r1.y, l(-1)
          else 
            iadd r0.y, r0.y, -r0.z
            iadd r0.z, l(9), r3.x
            imad r1.y, r0.z, l(3), l(6)
            itof r1.z, r1.y
            imad r0.z, r0.z, l(3), r0.y
            imul null, r0.z, l(-24), r0.z
            imad r0.z, r1.y, r1.y, r0.z
            itof r0.z, r0.z
            sqrt r0.z, r0.z
            add r0.z, -r0.z, r1.z
            add r0.z, r0.z, l(0.001000)
            ftou r0.z, r0.z
            udiv r0.z, null, r0.z, l(12)
            iadd r1.y, l(1), r0.z
            iadd r1.z, r0.z, l(-1)
            imad r1.w, l(-2), r1.y, r2.w
            ishl r2.x, r1.w, l(1)
            iadd r2.y, l(13), r2.x
            ishl r0.z, r0.z, l(1)
            iadd r0.z, -r3.y, r0.z
            imul null, r0.z, r0.z, r1.z
            imad r0.z, l(-8), r1.z, r0.z
            imad r0.y, r0.z, l(3), r0.y
            udiv r0.z, null, r0.y, r2.y
            imad r0.y, -r0.z, r2.y, r0.y
            iadd r2.y, r2.w, l(-3)
            imul null, r3.y, l(3), r2.y
            mov r3.x, l(0)
            iadd r2.yz, r0.wwww, r3.xxyx
            iadd r0.w, -r1.y, r2.w
            iadd r3.xy, r0.wwww, l(0, -2, 0, 0)
            imul null, r1.yz, r3.xxyx, r1.zzzz
            imad r1.yz, r1.yyzy, l(0, 3, 3, 0), r2.yyzy
            ilt r0.w, r0.z, l(2)
            if_nz r0.w
              iadd r2.yz, r1.wwww, l(0, 1, -1, 0)
              imad r0.zw, r2.yyyz, r0.zzzz, r1.yyyz
              iadd r2.y, r0.y, l(-4)
              ige r2.z, r2.y, l(0)
              if_nz r2.z
                iadd r2.z, r0.z, l(1)
                and r2.w, r1.w, l(-2)
                iadd r3.x, r2.w, l(2)
                ult r3.y, r2.y, r3.x
                if_nz r3.y
                  ushr r3.y, r2.y, l(1)
                  and r3.z, r2.y, l(-2)
                  iadd r3.z, r2.y, -r3.z
                  iadd r3.w, r0.w, r3.y
                  iadd r3.y, r2.z, r3.y
                  movc r3.y, r3.z, r3.y, r3.w
                else 
                  ieq r3.z, r2.y, r3.x
                  if_nz r3.z
                    mov r3.y, l(-1)
                  else 
                    ushr r3.z, r1.w, l(1)
                    iadd r3.x, r3.x, l(1)
                    ieq r3.x, r2.y, r3.x
                    if_nz r3.x
                      iadd r3.y, r2.z, r3.z
                    else 
                      iadd r3.x, r2.x, l(4)
                      ult r3.w, r2.y, r3.x
                      if_nz r3.w
                        iadd r2.w, -r2.w, r2.y
                        iadd r2.w, l(-4), r2.w
                        ushr r3.w, r2.w, l(1)
                        iadd r3.w, r3.w, r3.z
                        iadd r3.z, -r3.w, r3.z
                        ishl r3.z, r3.z, l(1)
                        iadd r2.w, r2.w, r3.z
                        iadd r3.z, r2.z, r3.w
                        iadd r3.w, r0.w, r3.w
                        movc r3.y, r2.w, r3.w, r3.z
                      else 
                        ieq r2.y, r2.y, r3.x
                        iadd r2.w, -r2.x, r0.y
                        iadd r2.w, l(-9), r2.w
                        ult r3.x, r2.w, l(2)
                        iadd r2.z, r2.z, r1.w
                        iadd r2.z, r2.z, r2.w
                        iadd r2.z, r2.z, l(-1)
                        ieq r2.w, r2.w, l(2)
                        iadd r3.z, r0.w, r1.w
                        iadd r3.z, r3.z, l(-1)
                        movc r2.w, r2.w, r3.z, l(-1)
                        movc r2.z, r3.x, r2.z, r2.w
                        movc r3.y, r2.y, l(-1), r2.z
                      endif 
                    endif 
                  endif 
                endif 
              else 
                ilt r2.y, r0.y, l(2)
                iadd r0.z, r0.z, r0.y
                ieq r2.z, r0.y, l(2)
                movc r0.w, r2.z, r0.w, l(-1)
                movc r3.y, r2.y, r0.z, r0.w
              endif 
              ine r0.z, r3.y, l(-1)
              iadd r0.w, r1.x, r3.y
              movc r0.x, r0.z, r0.w, l(-1)
            else 
              iadd r0.zw, r1.wwww, l(0, 0, -1, 2)
              ishl r2.yz, r0.zzwz, l(1)
              iadd r2.y, r1.z, r2.y
              iadd r2.z, r2.z, r1.y
              iadd r2.z, l(-2), r2.z
              iadd r2.z, r2.z, -r1.w
              iadd r0.w, r1.w, r0.w
              iadd r0.w, r0.w, l(-1)
              iadd r2.w, r0.y, l(-4)
              ige r3.x, r2.w, l(0)
              if_nz r3.x
                iadd r3.x, r1.w, l(1)
                and r3.y, r1.w, l(-2)
                iadd r3.z, r3.y, l(2)
                ult r3.w, r2.w, r3.z
                if_nz r3.w
                  ushr r3.w, r2.w, l(1)
                  and r4.x, r2.w, l(-2)
                  iadd r4.x, r2.w, -r4.x
                  iadd r4.y, r3.x, r3.w
                  movc r3.w, r4.x, r4.y, r3.w
                else 
                  ieq r4.x, r2.w, r3.z
                  if_nz r4.x
                    mov r3.w, l(-1)
                  else 
                    ushr r4.x, r1.w, l(1)
                    iadd r3.z, r3.z, l(1)
                    ieq r3.z, r2.w, r3.z
                    if_nz r3.z
                      iadd r3.w, r3.x, r4.x
                    else 
                      iadd r3.z, r2.x, l(4)
                      ult r4.y, r2.w, r3.z
                      if_nz r4.y
                        iadd r3.y, -r3.y, r2.w
                        iadd r3.y, l(-4), r3.y
                        ushr r4.y, r3.y, l(1)
                        iadd r4.y, r4.y, r4.x
                        iadd r4.x, -r4.y, r4.x
                        ishl r4.x, r4.x, l(1)
                        iadd r3.y, r3.y, r4.x
                        iadd r4.x, r3.x, r4.y
                        movc r3.w, r3.y, r4.y, r4.x
                      else 
                        ieq r2.w, r2.w, r3.z
                        iadd r2.x, -r2.x, r0.y
                        iadd r2.x, l(-9), r2.x
                        ult r3.y, r2.x, l(2)
                        iadd r3.x, r3.x, r1.w
                        iadd r3.x, r3.x, r2.x
                        iadd r3.x, r3.x, l(-1)
                        ieq r2.x, r2.x, l(2)
                        movc r2.x, r2.x, r0.z, l(-1)
                        movc r2.x, r3.y, r3.x, r2.x
                        movc r3.w, r2.w, l(-1), r2.x
                      endif 
                    endif 
                  endif 
                endif 
              else 
                ilt r2.x, r0.y, l(2)
                iadd r2.w, r1.w, r0.y
                ine r0.y, r0.y, l(2)
                movc r3.w, r2.x, r2.w, r0.y
              endif 
              ine r0.y, r3.w, l(-1)
              ige r1.w, r3.w, r1.w
              ieq r0.zw, r3.wwww, r0.zzzw
              iadd r2.x, r3.w, r2.z
              movc r0.w, r0.w, r1.y, r2.x
              iadd r1.y, r3.w, r2.y
              movc r0.z, r0.z, r1.z, r1.y
              movc r0.z, r1.w, r0.w, r0.z
              iadd r0.z, r1.x, r0.z
              movc r0.x, r0.y, r0.z, l(-1)
            endif 
          endif 
        endif 
      endif 
    endif 
  endif 
  ishl r0.y, vThreadID.x, l(2)
  store_raw u0.x, r0.y, r0.x
endif 
ret 
// Approximately 827 instruction slots used