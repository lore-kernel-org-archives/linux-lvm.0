Message-ID: <38CD003A.65F184DA@sarakinovconsulting.com>
Date: Mon, 13 Mar 2000 09:50:34 -0500
From: Goni Sarakinov <gsarak@sarakinovconsulting.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcreate seg faults
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: mauelsha@ez-darmstadt.telekom.de, linux-lvm@msede.com

Heinz Mauelshagen wrote:
> 
> > I am trying to do a vgcreate, but I keep on getting a segmentation
> > fault.
> >
> > Doing a vgcreate -v shows that after vgcreate does:
> >
> > vgcreate -- counting all existing volume groups
> > Segmentation fault
> 
> Could you please send a "vgcreate -d" output of your attempt?
> 
> Thanks,
> Heinz
> 

Here is the output of "vgcreate -vd"

vgcreate -- checking volume group name
vg_check_name -- CALLED
vg_check_name -- vg_name: "test_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vgcreate -- locking logical volume manager
lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
vgcreate -- checking volume group "test_vg" existence
lvm_tab_vg_check_exist -- CALLED with vg_name: "test_vg"
vg_check_name -- CALLED
vg_check_name -- vg_name: "test_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lvm_tab_read -- CALLED
lvm_tab_read -- LEAVING with ret: 0  data: 804CC08  size: 1
lvm_tab_vg_check_exist -- LEAVING with ret: 0
vgcreate -- counting all existing volume groups
lvm_tab_vg_check_exist_all_vg -- CALLED
Segmentation fault


Any ideas where the problem may be?

Goni Sarakinov
Sarakinov Consulting, Inc.
