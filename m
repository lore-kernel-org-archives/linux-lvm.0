From: Tom Dawes-Gamble <tmdg@avbrief.com>
Message-Id: <200009272014.UAA20254@lindbergh.avbrief.com>
Subject: Re: [linux-lvm] lv not persistent across reboot?
Date: Wed, 27 Sep 2000 20:14:54 +0000 (UTC)
In-Reply-To: <3.0.6.32.20000927105531.00eb8d30@laplaza.org> from "Mats Wichmann" at Sep 27, 2000 10:55:31 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mats Wichmann <mats@laplaza.org>
Cc: linux-lvm@msede.com

Hi,

HPUX LVM will show both devices in the volume group.
One device will be the "Primary link" and the other the "Alternate link"
The lvm commands label the primary and alternate link so you know which 
is which.  There are also option to allow you to switch them around.
The primary is the first device added to the volume group.

All I/O is done to the primary link.  If however the I/O fails on the 
Primary link LVM will switch to the Alternate link and use that.
So if controler "A" goes bad you can still use the VG via Controller B.
Of course if the disk goes bad your dead in the water.

If you have two disks visible on the same two controllers then you 
can set one primary on controller A and the other primary on controller
B then if either controller fails you just loose bandwidth but you don't
stop.

If fact when the Primary goes bad it switches and becomes the
Alternate link and the Alternate becomes the new Primary link.

If you want more detail just let me know.

Tom.

On Wed Sep 27 16:55:31 2000 Mats Wichmann wrote:-
> 
> At 02:47 PM 09/27/2000 +0000, Heinz J. Mauelshagen wrote:
> >
> >Morning Steve :-{)
> >
> >On Wed, Sep 27, 2000 at 07:19:14AM -0500, Steve Brueggeman wrote:
> >> Does this imply that Linux LVM will also have problems with discs in H.A.
> >> configurations? 
> >
> >Yes.
> >
> >> 
> >> For example: Fibre Channel drives have two ports on them.  If I have a
> Linux box
> >> with two Host Adapters, and each adapter is connected to the same set of
> drives,
> >> but on different ports, will v0.8final (without the patch below) have
> unstable
> >> vgscans?
> >
> >Yes, it should.
> >
> >> 
> >> I have not been following the high availability mailing list, and a
> solution may
> >> already exist  there.  If so, and you know how, I'd be interested in a
> quick
> >> description.
> >
> >Not that i am aware of.
> 
> Does anybody have any experience to contribute about what other
> LVM systems do in these situations?  They don't have the dynamic
> scan/assignment stuff in Solaris or AIX, right?  (Showing my
> ignorance here).
> 
> My experience of FC-AL setups is limited to theoretical at this
> point, but I had been wondering how they are addressed by systems.
> Is the dual-port stuff handled within the driver such that it's
> not actually presented as two separate "devices"?  The presence
> of two ports is a redundancy (+optionally performance) issue,
> so that would almost make sense to me that one would hide the
> physical reality inside the driver.
> 
> -- mats
> 


-- 
char  *r,*e,*w="%.9s%.7s%.7s\n";extern int printf(const char*,...);int main(){
int l=*w,a,b,th=*(w-~(l/=l))-*(w+l);b=*w+~th--;a=b-th;//Aviation Briefing Ltd.
r=e="  DISPLAY'tmdg@avbr';,,;'ief.com'*>"+b;l+=~b,th-=printf(w,e-a,th+e,r);
r=e="  DISPLAY'http://www.avbrief.com/' *>"-~b,exit(~l-printf(w,e+~a,th+e,r));}
