Message-ID: <3FC757CA.2030205@daemons-point.com>
From: Uli Heller <uli@daemons-point.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2: Problems with "lvextend" on device with mounted filesystem
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
Date: Fri Nov 28 08:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I'm using LVM1 for quite a while now and it works fine with me.
This week, I tried to use linux-2.6.0-test11 so I had to move to
LVM2 and device mapper. It works - at least partially.

A) works OK for all existing LVs
B) online resizing does not work

At first, I thought that "reiserfs" might be responsible for
this. But after some tests, I don't think so any more.
Here is what i did to test:

1) Create a new logical volume:
~   lvcreate -L 100M -n ulilv systemvg
2) Display this new LV:
~   lvdisplay -c /dev/systemvg/ulilv
~     /dev/systemvg/ulilv:systemvg:3:1:-1:0:204800:25:-1:0:0:254:5
3) Try to write right behind the end of the LV:
~   dd if=/dev/zero of=/dev/systemvg/ulilv seek=204800 bs=512 count=5
~   dd: writing `/dev/systemvg/ulilv': No space left on device
~   1+0 records in
~   0+0 records out
~   --> This error message is OK
4) Extend the LV:
~   lvextend -L +100M /dev/systemvg/ulilv
5) Repeat step 3
~   dd if=/dev/zero of=/dev/systemvg/ulilv seek=204800 bs=512 count=5
~   5+0 records in
~   5+0 records out
~   --> OK, now the LV is large enough
6) Remove the LV
~   lvremove -f /dev/systemvg/ulilv

As expected - you might think.
Now a slight variation:

1 and 2) Like above
2.5)     Create and mount a file system on the LV:
~   mkreiserfs -f /dev/systemvg/ulilv
~   mount /dev/systemvg/ulilv /mnt
3,4,5)   Like above **BUT** step 5 now produces the same
~   error message as step 3! You have to "umount /mnt"
~   in order to be able to access the enlarged portion
~   of the LV.

I checked it with
- - linux-2.6.0-test11
- - linux-2.6.0-test5 (from SuSE-9.0)
and with "mkreiserfs" and with "mke2fs" on step 2.5).
Everything produces the same result.

With lvm1 and linux-2.4.21 from the rescue system
of SuSe-9.0 it works as expected (= no error message
on step 5).

I upgraded to
- - lvm2-2.00.08
- - device-mapper-1.00.07
but the error still exists.

Then I migrated to the new metadata format
with "vgconvert -M2 systemvg" but the error
still exists.

Thanks for any ideas/suggestions...

- --
Mit frohem Gru�e, Uli Heller

daemons point, Gesellschaft f�r Datenverarbeitung mbH
Zahn-Nopper-Str. 1-3                 Phone: +49-711-806708-0
70435 Stuttgart                      Fax:   +49-711-806708-19
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/x1fKsi63wwMPCzwRAtYvAJ0byNDnlDga98nhBs/KNkVMMh98fQCgqO/T
/xwaHtQnvm8e88Zg+kflmYI=
=fZsA
-----END PGP SIGNATURE-----
