Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1EJLitW018586
	for <linux-lvm@redhat.com>; Fri, 14 Feb 2014 14:21:44 -0500
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1EJLeib010107
	for <linux-lvm@redhat.com>; Fri, 14 Feb 2014 14:21:41 -0500
Received: by mail-ve0-f181.google.com with SMTP id cz12so9849201veb.40
	for <linux-lvm@redhat.com>; Fri, 14 Feb 2014 11:21:40 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 14 Feb 2014 14:21:40 -0500
Message-ID: <CACOqYcnRf_7NGKVObo-uQb0Dvzbmd+ntkZ_PPGe4QmRrgTx_SQ@mail.gmail.com>
From: Jeremy Smith <jeremy@esilo.com>
Subject: [linux-lvm] Converting existing thick LVs into thin LVs possible?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have a system currently using LVM2 that was originally set up on
RHEL5 (where thin provisioning was not supported).
This system would greatly benefit from the newer thin provisioning
features, and so I am investigating upgrading to RHEL6 so that I may
take advantage. My question is this: Can I convert existing LVM2
"thick" logical volumes into thinly-provisioned volumes on the fly?

This page:
 https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/thinly_provisioned_volume_creation.html

lead me to believe that it is possible:
 "You can use the --thinpool parameter of the lvconvert command to
convert an existing logical volume to a thin volume."

with the following:

 lvconvert --thinpool vg001/lv1 --poolmetadata vg001/lv2

However, I seem to not understand how that works. From the example, I
would assume that vg001/lv1 is the existing "thick" LV that I want to
convert and that vg001/lv2 is an existing LV with enough space to
become the metadata. So, I create a metadata LV with:

test@testbox:~$ sudo lvcreate  -L16G MyVG -n Metadata
  Logical volume "Metadata" created

But when I attempt the conversion, I do not get what I would expect:

test@testbox:~$ sudo lvconvert --thinpool  MyVG/OldThickLV1
--poolmetadata MyVG/Metadata
  Converted MyVG/OldThickLV1 to thin pool.

Then the OldThickLV1 disappears, leaving Metadata around:

test@testbox:~$ sudo lvdisplay
  --- Logical volume ---
  LV Name                Metadata
  VG Name                MyVG
  LV UUID                IZb6zP-D7iD-NswX-XcDZ-K5fN-sGBj-lCMiqO
  LV Write Access        read/write
  LV Creation host, time testbox, 2014-02-14 13:50:04 -0500
  LV Pool transaction ID 0
  LV Pool metadata       Metadata_tmeta
  LV Pool data           Metadata_tdata
  LV Pool chunk size     64.00 KiB
  LV Zero new blocks     no
  LV Status              available
  # open                 0
  LV Size                16.00 GiB
  Allocated pool data    0.00%
  Allocated metadata     0.01%
  Current LE             4096
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:5


Am I doing something wrong here?
Or am I going to have to create a new thin pool, new thin logical
volumes, and copy the data over?


Thanks,

-- 
Jeremy
