Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8PGAc4O025756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2016 12:10:38 -0400
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6444C05A28D
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2016 16:10:37 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id g192so144513782ywh.1
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2016 09:10:37 -0700 (PDT)
MIME-Version: 1.0
From: Marc Smith <marc.smith@mcc.edu>
Date: Sun, 25 Sep 2016 12:10:36 -0400
Message-ID: <CAHkw+LeeTVO_2bKV4rSOek+S4nxoWKZuNdwgyAQ9PmgCD3+hoA@mail.gmail.com>
Subject: [linux-lvm] ocf:lvm2:VolumeGroup RA Question
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

Hi,

I'm using the "VolumeGroup" RA that comes with LVM2. On the machines
I'm testing with, we are currently using version 2_02_129 of LVM2.

My question is regarding this function in the VolumeGroup RA:

--snip--
VolumeGroup_status() {

    VGOUT=`vgdisplay -v $OCF_RESKEY_volgrpname 2>&1` || exit $OCF_ERR_GENERIC
    echo "$VGOUT" | grep -i 'Status[ \t]*available' >/dev/null
    rc=$?

    if [ $rc -eq 0 ]; then
    ocf_log debug "LVM Volume Group $OCF_RESKEY_volgrpname is
available (started)"
    else
    ocf_log debug "LVM Volume Group $OCF_RESKEY_volgrpname is not
available (stopped)"
    return $OCF_NOT_RUNNING
    fi

    if echo "$VGOUT" | grep -i 'Access.*read/write' >/dev/null; then
    ocf_log debug "Volume $OCF_RESKEY_volgrpname is available
read/write (running)"
    else
    ocf_log debug "Volume $OCF_RESKEY_volgrpname is available
read-only (running)"
    fi

    return $OCF_SUCCESS
}
--snip--

And what prompted me to question this function, is I noticed that
unless an LV is created on my VG, this function doesn't return
OCF_SUCCESS.

When looking at the vgdisplay output in the first few lines of the
function, there are several different output lines that contains the
string "Status" (assuming the command exists successfully):

# vgdisplay -v vmdk5 2>&1 | grep Status
  VG Status             resizable
  LV Status              available
  PV Status             allocatable

In the next line of the function where we grep for "Status" we don't
specify a specific line (eg, "VG Status", "LV Status", or "PV
Status").

My question is this: Is the intention that we only return OCF_SUCCESS
if a LV is available? In my setup, I'd like the resource to start/run
properly without having any LV created. Any harm in updating the RA to
look for "VG Status" and return success if it finds "resizable" -- I'm
not sure what the other status strings might be? Is "available" valid
for that line as well?


Thanks for your time.


--Marc
