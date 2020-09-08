Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53D27A37A3
	for <linux-lvm@redhat.com>; Tue,  8 Sep 2020 12:32:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F1C6906383
	for <linux-lvm@redhat.com>; Tue,  8 Sep 2020 12:32:33 +0000 (UTC)
References: <4081c11e-d2b0-ebfa-d1a0-92a4efc79e81@redhat.com>
	<EEEA1F5E-B6AC-47CD-89BD-C4AF592749F2@gmail.com>
	<643c43ad-0814-18a7-bb60-439adb4c6514@redhat.com>
From: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>
Message-ID: <a729f619-56e6-b949-eaee-4719fcec33ef@gmail.com>
Date: Tue, 8 Sep 2020 14:32:23 +0200
MIME-Version: 1.0
In-Reply-To: <643c43ad-0814-18a7-bb60-439adb4c6514@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------5658DE6AE8A38C07BC45B845"
Content-Language: sv
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------5658DE6AE8A38C07BC45B845
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,


This is the steps that I did.

- the COW data exists on /dev/loop1, including space for the PV header + 
metadata

I created a fakevg template file from vgcfgbackup /tmp/fakevg.bkp

( the content of this file I created fake uuid etc... )


I craete a fake uuid for the PV

# pvcreate -ff -u fake-uidx-nrxx-xxxx --restorefile /tmp/fakevg.bkp


And created rhe metadata from the backup

# vgcfgrestore -f /tmp/fakevg.bkp fakevg


I can now see the lvsnap in fakevg

Perhaps the restore can be done directly to the destination vg? not sure...

Anyhow, I than used the vgsplit to move the fakevg data to the 
destination vg

# vgsplit fakevg destvg /dev/loop1


I know have the lvsnap volume in the correct volume group

 From here, I connected the lvsnap to a lv destination using

# lvconvert -Zn -s destvg/lvsnap destvg/destlv


I know have a snapshot connected to the origin destlv

 From here, I can either mount the snapshot and start using it, or 
revert to the snapshot

# lvchange -a n destvg/destlv
# lvconvert --merge -b destvg/lvsnap
# lvchange -a y destvg/destlv


Now to my questions...

is there any DBUS api that can perform the vgcfgrestore operations that 
I can use through C?

or another ways to recreate the metadata?

I have to now use two steps: pvcreate + vgcfgrestore, where I just need 
to actually restore just the metadata (only vgcfgrestore)?

If I run vgcfgrestore without pvcreate, than vgcfgrestore will not find 
the pvid, and cant be executed with a parameter like:

# vgcfgrestore -f vgXX.bkp /dev/nbd

Instead it has to be used with the parameter vgXX pointing out the 
volume group...


I can live with vgcfgrestore + pvcreate, but would prefer to use the 
libblockdev (DBUS) or another api from C directly.

What options do I have?


Thanks for an excellent help

God Bless

Tomas



Den 2020-09-07 kl. 19:50, skrev Zdenek Kabelac:
> Dne 07. 09. 20 v 19:37 Tomas Dalebjörk napsal(a):
>> thanks
>>
>> ok
>>   vgsplit/merge instead
>> and after that lvconvert-s
>>
>> yes, I am aware of the issues with corruption
>> but if the cow device has all data, than no corruption will happen, 
>> right?
>>
>> if COW has a copy of all blocks
>> than a lvconvert —merge, or mount of the snapshot volume will be 
>> without issues
>
> If the 'COW' has all the data - why do you need then snapshot ?
> Why not travel whole LV instead of snapshot ?
>
> Also - nowdays this old (so called 'thick') snapshot is really slow 
> compared with thin-provisioning - might be good if you check what kind 
> of features
> you can gain/loose if you would have switched to thin-pool
> (clearly whole thin-pool (both data & metadata) would need to travel 
> between your VGs.)
>
> Regards
>
> Zdenek
>

--------------5658DE6AE8A38C07BC45B845
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p><br>
    </p>
    <p>This is the steps that I did.</p>
    <p>- the COW data exists on /dev/loop1, including space for the PV
      header + metadata</p>
    <p>I created a fakevg template file from vgcfgbackup /tmp/fakevg.bkp
      <br>
    </p>
    <p>( the content of this file I created fake uuid etc... )</p>
    <p><br>
    </p>
    <p>I craete a fake uuid for the PV<br>
    </p>
    <p><font face="Courier New, Courier, monospace"># pvcreate -ff -u
        fake-uidx-nrxx-xxxx --restorefile /tmp/fakevg.bkp</font><br>
    </p>
    <p><br>
    </p>
    <p>And created rhe metadata from the backup</p>
    <p><font face="Courier New, Courier, monospace"># vgcfgrestore -f
        /tmp/fakevg.bkp fakevg</font></p>
    <p><br>
    </p>
    <p>I can now see the lvsnap in fakevg</p>
    <p>Perhaps the restore can be done directly to the destination vg?
      not sure...</p>
    <p>Anyhow, I than used the vgsplit to move the fakevg data to the
      destination vg</p>
    <p><font face="Courier New, Courier, monospace"># vgsplit fakevg
        destvg /dev/loop1</font></p>
    <p><br>
    </p>
    <p>I know have the lvsnap volume in the correct volume group</p>
    <p>From here, I connected the lvsnap to a lv destination using</p>
    <p><font face="Courier New, Courier, monospace"># lvconvert -Zn -s
        destvg/lvsnap destvg/destlv</font></p>
    <p><br>
    </p>
    <p>I know have a snapshot connected to the origin destlv</p>
    <p>From here, I can either mount the snapshot and start using it, or
      revert to the snapshot</p>
    <font face="Courier New, Courier, monospace"># lvchange -a n
      destvg/destlv<br>
      # lvconvert --merge -b destvg/lvsnap<br>
      # lvchange -a y destvg/destlv</font>
    <p><br>
    </p>
    <p>Now to my questions...</p>
    <p>is there any DBUS api that can perform the vgcfgrestore
      operations that I can use through C? <br>
    </p>
    <p>or another ways to recreate the metadata?</p>
    <p>I have to now use two steps: pvcreate + vgcfgrestore, where I
      just need to actually restore just the metadata (only
      vgcfgrestore)?</p>
    <p>If I run vgcfgrestore without pvcreate, than vgcfgrestore will
      not find the pvid, and cant be executed with a parameter like:</p>
    <p># vgcfgrestore -f vgXX.bkp /dev/nbd</p>
    <p>Instead it has to be used with the parameter vgXX pointing out
      the volume group...</p>
    <p><br>
    </p>
    <p>I can live with vgcfgrestore + pvcreate, but would prefer to use
      the libblockdev (DBUS) or another api from C directly.</p>
    <p>What options do I have?</p>
    <p><br>
    </p>
    <p>Thanks for an excellent help <br>
    </p>
    <p>God Bless</p>
    <p>Tomas<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Den 2020-09-07 kl. 19:50, skrev Zdenek
      Kabelac:<br>
    </div>
    <blockquote type="cite"
      cite="mid:643c43ad-0814-18a7-bb60-439adb4c6514@redhat.com">Dne 07.
      09. 20 v 19:37 Tomas Dalebjörk napsal(a):
      <br>
      <blockquote type="cite">thanks
        <br>
        <br>
        ok
        <br>
          vgsplit/merge instead
        <br>
        and after that lvconvert-s
        <br>
        <br>
        yes, I am aware of the issues with corruption
        <br>
        but if the cow device has all data, than no corruption will
        happen, right?
        <br>
        <br>
        if COW has a copy of all blocks
        <br>
        than a lvconvert —merge, or mount of the snapshot volume will be
        without issues
        <br>
      </blockquote>
      <br>
      If the 'COW' has all the data - why do you need then snapshot ?
      <br>
      Why not travel whole LV instead of snapshot ?
      <br>
      <br>
      Also - nowdays this old (so called 'thick') snapshot is really
      slow compared with thin-provisioning - might be good if you check
      what kind of features
      <br>
      you can gain/loose if you would have switched to thin-pool
      <br>
      (clearly whole thin-pool (both data &amp; metadata) would need to
      travel between your VGs.)
      <br>
      <br>
      Regards
      <br>
      <br>
      Zdenek
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------5658DE6AE8A38C07BC45B845--
