Message-ID: <39FF049B.F7651520@imim.es>
Date: Tue, 31 Oct 2000 18:42:52 +0100
From: Xavi Fustero <xfustero@imim.es>
MIME-Version: 1.0
Subject: [linux-lvm] Exporting VG
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I have a cluster with 4 nodes. 3 of them has several disks which I need
to see as an only one disk. After a really strong work I got LVM working
on all the 3 machines !!!! i created three Volume Groups, one for
machine. Now, I would like to export them to get only one virtual group.
I am trying to export them to a machine and merge the volume groups but
I do not success trying to export them.I have not find many
documentation about this ?!?
Thats my 3 machines: N1, N2 and N3.  From N2 I try to export my VG to
N1.
N2> vgchange -a n  'vg_name'
N2> vgexport 'vg_name'

From N1 I type,
N1>vgimport 'vg_name'  /dev/sda3   (this vg is made from /dev/sda3 )
but I only get error messages !!!!


pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda3
pv_read -- LEAVING with ret: 0
vgimport -- ERROR: physical volume "/dev/sda3" doesn't belong to an
exported volume group

Does anybody try this ?!!!!
Thanks in advance,
Xavi !



--
Xavi Fustero Benavent
Institut Municipal d'Investigacio Medica (IMIM)
Departament Genome Informatics
Tel.: +34-93-221 10 09    Ext: 2016
