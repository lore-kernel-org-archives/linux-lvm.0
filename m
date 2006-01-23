Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C61FC3.07ABF28F"
Subject: RE: [linux-lvm] Difference in LVM and LVM2 and their strength/weakness
Date: Sun, 22 Jan 2006 18:16:33 -0800
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B07AC77@pmi00exf00.us.packetmotion.com>
From: "Alex Chen" <achen@packetmotion.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C61FC3.07ABF28F
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Heinz, thanks for the information/
=20
The main intention of our interest of LIME to use it for snapshots.
I am told that it is a very quick way to make backups.  Is that true? Is =
there any measuring number for this?
=20
From the recent discussion on snapshots, it seems there are still some =
issues, and even a kernel patch.
Does RHEL 4 contain such patch?  Or is there a downloadable patch if we =
buy one?
=20
From what I've read from the Web regarding LIME is that LVM1 is a =
read/only while LVM2 is read/write.
The read/only mode, if I understand correctly, is that the PE where the =
data resides is first copied to an exception table, (is this the COW =
table?)
before the destination PE is changed.  Is this correct?  If so, does the =
copy involves actual data movement or only a manipulation of
of the FAT table? =20
The LVM2's read/write mode seems to simply mark the PE in the snapshot =
but the change is not copied from the changed PE to the snapshot, right?
=20
In either way, the snapshot seems to be keeping tracks of only the =
changes, i.e. delta.  Doe we need to first create a full copy of the =
file system as the base, or we only need to keep the deltas, if we want =
to use snapshot for system backups?
=20
Sorry of all the questions, some of them may be pretty basic or =
ignorant.  If you feel I should get the answers from other sources, I =
would really apprecaite it if you can give me the pointer.
=20
Alex=20

________________________________

From: linux-lvm-bounces@redhat.com on behalf of Heinz Mauelshagen
Sent: Sat 1/21/2006 09:08
To: LVM general discussion and development
Subject: Re: [linux-lvm] Difference in LVM and LVM2 and their =
strength/weakness



On Fri, Jan 20, 2006 at 05:54:12PM -0800, Alex Chen wrote:
> Greetings,

Hi.

>
>   I am tasked to investigate the differences between LVM and LVM2.  I =
am
> new to LVM so it would be greatly appreciated if someone can explain =
or
> point me to the right direction for the following questions:
>
>=20
>
> 1.    What does LVM2 have that is not available in LVM?

It has command line extensions beyond lvm (eg, vgs, lvs, pvs commands).

It's configurable in various regards (eg, device name filters)

The limits of 256 grand total logical volumes and ~64k extents per =
logical
volume are gone.

Logical volume snapshots are asynchronous rather than synchronuous
and gain better performance.

pvmove (online data relocation) is based on temporary, restartable =
mirrors
which wasn't the case in LVM1.


> Or is it a
> only better architectured implementation of LVM?

I'ld not say 'only', but yes, it is :)


> 2.    Which version of Red Hat enterprise system uses which LVM?  And
> does the user need to do any configuration during installation?

RHEL3 comes with LVM, RHEL4 with LVM2.

> 3.    If LVM2 is definitely better than LVM, how stable is it?

It is stable with the exception of rare snapshot issues,
we're fixing right now.

>
>=20
>
> Thanks.
>
> Alex
>

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



------_=_NextPart_001_01C61FC3.07ABF28F
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IiICAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEARwAAAFJFOiBbbGludXgtbHZtXSBE
aWZmZXJlbmNlIGluIExWTSBhbmQgTFZNMiBhbmQgdGhlaXIgc3RyZW5ndGgvd2Vha25lc3MAqBgB
BYADAA4AAADWBwEAFgASABAAIQAAADcBASCAAwAOAAAA1gcBABYAEgAQACEAAAA3AQEJgAEAIQAA
ADI4NDkwMUU0MEQ1NEE1NEFBNjU0RjM3QjM4QURGQjI3ACwHAQOQBgCgIgAANwAAAAMANgAAAAAA
QAA5AI/yqwfDH8YBHgA9AAEAAAAFAAAAUkU6IAAAAAACAUcAAQAAADgAAABjPVVTO2E9IDtwPXBh
Y2tldG1vdGlvbjtsPVBNSTAwRVhGMDAtMDYwMTIzMDIxNjMzWi03MDI4AB4ASQABAAAARwAAAFJl
OiBbbGludXgtbHZtXSBEaWZmZXJlbmNlIGluIExWTSBhbmQgTFZNMiBhbmQgdGhlaXIgc3RyZW5n
dGgvd2Vha25lc3MAAEAATgAAGj1HrR7GAR4AWgABAAAAHQAAAGxpbnV4LWx2bS1ib3VuY2VzQHJl
ZGhhdC5jb20AAAAAAgFbAAEAAABXAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAAbGludXgtbHZt
LWJvdW5jZXNAcmVkaGF0LmNvbQBTTVRQAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AAAIB
XAABAAAAIgAAAFNNVFA6TElOVVgtTFZNLUJPVU5DRVNAUkVESEFULkNPTQAAAB4AXQABAAAAEgAA
AEhlaW56IE1hdWVsc2hhZ2VuAAAAAgFeAAEAAABGAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAA
SGVpbnogTWF1ZWxzaGFnZW4AU01UUABtYXVlbHNoYWdlbkByZWRoYXQuY29tAAAAAgFfAAEAAAAc
AAAAU01UUDpNQVVFTFNIQUdFTkBSRURIQVQuQ09NAB4AZgABAAAABQAAAFNNVFAAAAAAHgBnAAEA
AAAdAAAAbGludXgtbHZtLWJvdW5jZXNAcmVkaGF0LmNvbQAAAAAeAGgAAQAAAAUAAABTTVRQAAAA
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
P/1P/l//bwB//wGPAp8DrwS/Bc8G3wfvCP//Cg8LHwwvDT8OTw9fEG8Rf/8SjxOfFK8VvxbPF98Y
7xn//xsPHB8dLx4/H08gXyFvIn//I48knyWvJr8nzyjfKe8q//8sDy0fLi8vPzBPMV8ybzN//zSP
NZ82rze/OM853zrvO///PQ8+Hz8vQD9BT0JfQ29Ef19Fj9PPk22yEJSASJWRRzhtYkjov+nP59xD
b6+bUJ9QfgFr0ETV0WzYIO5t7fCVrezmRWvA58HV8P9HP0hPRn9Sz1PfVO9V/1cP/1gfWS9aP1tP
XF9db15/X4//YJ9hr2K/Y89k32XvZv9oD/9pH2ovaz9sT21fbm9vf3CP/3Gfcq9zv3TPdd9273f/
eQ//eh97L3w/fU9+X39vgH+Bj1tJX1DvQdkwxzBu59BuP+3AT7FNAEw/TU9OXWx1V9eQ1fDIAG5L
kFPYcHL/7dGGP7+TT+mDX4Rvgp+PL/+QP5FPkl+Tb5R/lY+Wn5ev/5i/mc+a35vvnP+eD58foC//
oT+iT6NfpG+lf6aPp5+or/+pv6rPq9+s763/rw+wH7Ev/7I/s0+0X7Vvtn+3j7ifua8/ur+7z7zf
ve+Ff40fNTaYMjQywp/tFXJp7fDRjIBjaGSMcGaIn4mv/+ffv+/A/8j/yg/LH8wvzT//zk/PX9Bv
0X/Sj9Of1K/Vv//Wz9ff2O/Z/9sP3B/dL94//99P4F/hb+J/44/kn+Wv5r//58/o3+nv6v/sD+0f
7i/vP//wT/Ff8m/zf/SP9Z/2r/e///jP+d/67/v//Q/+H/8vAD//AU8CXwNvBH8FjwafB68Iv/8J
zwrfC+8M/w4PDx8QLxE//xJPE18UbxV/Fo8XnxivGb//Gs8b3xzvHf8fDyAfIS8iP/8jTyRfJW8m
fyePKJ8pryq//yvPLN8t7y7/MA8xHzIvMz//NE81XzZvN384jzmfOq87v/88zz3fPu8//0EPQh9D
L0Q//0VPRl9Hb0h/SY9Kn0uvTL9/Tc9O30/vUP9SD8IvhtpH9YvgbYwQecaPx5/IrMWgGnWOUHOI
IIygbkBSAGVkSGF0LmNv/m1Tj1SfUs9c713/Xw9gH/9hL2I/Y09kX2VvZn9nj2if/2mvar9rz2zf
be9u/3APcR//ci9zP3RPdV92b3d/eI95n/96r3u/fM99337vf/+BD4If/4MvhD+FT4Zfh2+If4mP
ip//i6+Mv43Pjt+P75D/kg+TH/+UL5U/lk+XX5hvmX+aj5uf/5yvnb+ez5/foO+h/6MPpB8PpS+m
P1ZfV2QrNDkgHjLEAFkgqk9XgjE0MfgyMDBYP1lPyK+nj6if/7BPsV+yb7N/tI+1n7avt7//uM+5
37rvu/+9D74fvy/AP//BT8Jfw2/Ef8WPxp/Hr8i//8nPyt/L78z/zg/PH9Av0T//0k/TX9Rv1X/W
j9ef2K/Zv//az9vf3O/d/98P4B/hL+I//+NP5F/lb+Z/54/on+mv6r//68/s3+3v7v/wD/Ef8i/z
P//0T/Vf9m/3f/iP+Z/6r/u///zP/d/+7///AQ8CHwMvBD//BU8GXwdvCH8JjwqfC68Mv/8Nzw7f
D+8Q/xIPEx8ULxU//xZPF18Ybxl/Go8bnxyvHb//Hs8f3yDvIf8jDyQfJS8mP/8nTyhfKW8qfyuP
LJ8try6//y/PMN8x7zL/NA81HzYvNz//OE85XzpvO388jz2fPq8/v/9Az0HfQu9D/0UPRh9HL6k/
Y6wvV4JGQVhMH1dzOXQyNE8gNq3fru+v/D3+LVJvU39Uj1WfViZPb1B/76//V39Yj1mZX11PXl9f
Kg9aT1tfWWxZQXV4LWyMdm1Nr6tDbWFpWUHyZ2Mhc3RgP2FPYl9jZABAcmVkaGF0Lnhjb21l72b/
WW9JazyKQaskaGmAZj0iSrCAdHBzOi8vd2+Ami5piC9lImUgbi9lotlsMGZvcOFjVSJraWpAoGZp
ZWxkakJmcyADbDBlwHtIWVBFUuBMSU5LIG7/cA9xH0x9fXLRcyByc0nAXMBjZjFcdWxsAGyX/3S/
dc9xLUqnSpdtAHy/bP7zTwBrIC9Ba2BqL2s/bEwZaYBhZGPPq0N0aGUAIExWTSBIT1dwLVRPIGnA
bR9uL3AFefF0cyBwLm9yZ9YvhaGF4C+FYS2JJHIf/3MvdDqIb4l6d9947o0PiXn/ff99z37ff++A
/4IPlL+XEoI1l2EvRk9OVJe5/5M/SwCrMpuYmLirI5i/SYYqN5YCUJZeMIchL0TsSVaa758PZ5PB
q0OjbwmkfzU4lhFCT0RZL5ZdlgClr6gxN5YRSFQUTUyXsH2qYAAAHgA1EAEAAABIAAAAPEU4QUZG
RUZEQkU5N0M5NEU5Mjk3OTYzRjA1MjdBMDdCMDdBQzc3QHBtaTAwZXhmMDAudXMucGFja2V0bW90
aW9uLmNvbT4AHgBHEAEAAAAPAAAAbWVzc2FnZS9yZmM4MjIAAAsA8hABAAAAHwDzEAEAAACaAAAA
UgBFACUAMwBBACAAWwBsAGkAbgB1AHgALQBsAHYAbQBdACAARABpAGYAZgBlAHIAZQBuAGMAZQAg
AGkAbgAgAEwAVgBNACAAYQBuAGQAIABMAFYATQAyACAAYQBuAGQAIAB0AGgAZQBpAHIAIABzAHQA
cgBlAG4AZwB0AGgA//h3AGUAYQBrAG4AZQBzAHMALgBFAE0ATAAAAAAACwD2EAAAAABAAAcwYpRH
0L4fxgFAAAgwaUC6B8MfxgEDAN4/r28AAAMA8T8JBAAAHgD4PwEAAAAKAAAAQWxleCBDaGVuAAAA
AgH5PwEAAABhAAAAAAAAANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC9PPVBBQ0tFVE1PVElPTi9P
VT1GSVJTVCBBRE1JTklTVFJBVElWRSBHUk9VUC9DTj1SRUNJUElFTlRTL0NOPUFDSEVOAAAAAB4A
+j8BAAAAFQAAAFN5c3RlbSBBZG1pbmlzdHJhdG9yAAAAAAIB+z8BAAAAHgAAAAAAAADcp0DIwEIQ
GrS5CAArL+GCAQAAAAAAAAAuAAAAAwD9P+QEAAADABlAAAAAAAMAGkAAAAAAAwAdQAAAAAADAB5A
AAAAAB4AMEABAAAABgAAAEFDSEVOAAAAHgAxQAEAAAAGAAAAQUNIRU4AAAAeADJAAQAAAB0AAABs
aW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAB4AM0ABAAAAFwAAAG1hdWVsc2hhZ2VuQHJl
ZGhhdC5jb20AAB4AOEABAAAABgAAAEFDSEVOAAAAHgA5QAEAAAACAAAALgAAAAMAdkD/////CwAp
AAAAAAALACMAAAAAAAMABhDYASrPAwAHEIELAAADABAQAAAAAAMAERAAAAAAHgAIEAEAAABlAAAA
SEVJTlosVEhBTktTRk9SVEhFSU5GT1JNQVRJT04vVEhFTUFJTklOVEVOVElPTk9GT1VSSU5URVJF
U1RPRkxJTUVUT1VTRUlURk9SU05BUFNIT1RTSUFNVE9MRFRIQVRJVElTQQAAAAACAX8AAQAAAEgA
AAA8RThBRkZFRkRCRTk3Qzk0RTkyOTc5NjNGMDUyN0EwN0IwN0FDNzdAcG1pMDBleGYwMC51cy5w
YWNrZXRtb3Rpb24uY29tPgDVng==

------_=_NextPart_001_01C61FC3.07ABF28F--
