From: "Andy Francke" <afrancke@cisco.com>
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <NDBBJIIIAKLGEPBFEKBGMEHCGDAA.afrancke@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB01258A8E@mercury.infiniconsys.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Mar 10 16:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> OK, so I RTFM'd and have the LVM2 patch created against the
> vanilla kernel.org 2.4.20. Sorry for asking such a dumb question.
> Also, just got the latest xfs patch from sgi too, and am awaiting
> your instructions on what to change before applying either.
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Here's the patch for the devmapper patch. Navigate to whatever directory
contains "linux-2.4.19-devmapper-ioctl.patch" on your system (likely
/usr/src/kernel-patches/all/device-mapper). Uudecode and unzip the patch
attached (inline) - you will then want to patch your devmapper patch file by
running:

"patch -p0 < linux-2.4.19-devmapper-ioctl-patch.patch"

Make a copy of your linux-2.4.19-devmapper-ioctl.patch first so you can do a
before and after diff - the net result should be the deletion of several
lines following "BH_Inode" and the changing of a few line count numbers
above to compensate.

Now both devmapper and the XFS patches will apply cleanly. Do the XFS
patches first.

begin 644 linux-2.4.19-devmapper-ioctl-patch.patch.bz2
M0EIH.3%!629366D)1^4``&M?@`(P0'__^'1US(J_]]_@0`(57-E;:"40@)M)
M/!-":/48@,30R&FGH02IHT*>C%)^E-'J&F0`!H``&AS``3``$P`````$HD-`
MD]E";4PU#T!#"80Q#&DQ72Q:-8G@7O!HA4W1"R_*W)WQB1?91$8E6'?-^G!L
MW"9L1CZ\F5V(I#=;E"'?'62X+X707/GEOOHJJ5JJYHW0JZI8NE'&@2=HVRNG
M.BMU;%\]:7)5/9SW8.28V@R[13%G0<HHFA4I"QB"ZH<-K[%TX^T\PE3("S.%
M%+!&!!$$YTA]):Q)Q*@;9B$]PEK9N<'9RK2&8'(IL%-8\&!2?*C85H#X\8AZ
M0JH-"42_),2R#(EA&Z$2;6]TY[A<$0G,A08KF*U7Q)7+"Q`C$)R-F%(591GV
M`4`][,R_-:'P(WB&QGCF<^)BZ]>G<AQX\K_+TVMZI(%)SHF_EOB.>I(_>:0D
M<UD,1_+M%52M&8HSUD*4!<X\S/+!A&4"(.X"3VD/B\\ME7-<K:4&,<6+6LDO
MX-C@&E&!P]S@4%G",N!E*6&U,"JUXXB&!]KVBI@8#IK00/$)J2,?(VZBT*+-
M5&@K1V&$%S0&5"-<`F/SEB""4H&[6W')[T&&45ZC+9IW$54#)JNC>*F+(8DN
MK2"NE+%#LBYP/@HD6VP=9[V&R%%3[Y\L-.+1*F+I)?0UY'`J$RY`=597DH&$
BB!*^R,W@TAK?"3528P1:E2R19889,O^+N2*<*$@TA*/R@```
