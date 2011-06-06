Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p56DRv5G014487
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 09:27:57 -0400
Received: from agslnx2.affinitygs.com (ns6.affinitygs.com [69.84.79.108] (may
	be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p56DRtZO014914
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 09:27:55 -0400
Received: from [10.1.10.82] (bisleglnx2.affinitygs.com.10.1.10.in-addr.arpa
	[10.1.10.2] (may be forged))
	by agslnx2.affinitygs.com (8.14.3/8.14.3) with ESMTP id p56Dj0JK020514
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 08:45:00 -0500
Message-ID: <4DECD5C6.9010405@affinitygs.com>
Date: Mon, 06 Jun 2011 08:27:34 -0500
From: Anthony Nelson <anthonyn@affinitygs.com>
MIME-Version: 1.0
References: <BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com>
In-Reply-To: <BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------080008040003010703050708"
Subject: Re: [linux-lvm] LVM label lost / system does not boot
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------080008040003010703050708
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Don't think I'm much of an expert in this area, but I had a similar 
issue that I worked through last week. I wasn't using mdadm, but I don't 
really think this is a situation that is really relevant to that.

I posted the question on serverfault and got enough help to get me 
through it. You can see it here:
http://serverfault.com/questions/275679/rescue-disk-is-unable-to-see-the-lvm-physical-volumes

The suggestion that got me on the right track seems to be very similar 
to your situation. How to recover your lvm configuration with mdadm.
http://www.howtoforge.com/recover_data_from_raid_lvm_partitions

The steps I went through were basically:
* Recover config using dd per steps in that article
* Recreate the physical volume using the same device
* Do a pvcfgrestore on the recovered config from step 1

That got me back up and running. I hope it helps.

Anthony Nelson
Affinity Global Solutions
701.223.3565 Ext: 13


On 6/5/2011 7:47 AM, Andreas Schild wrote:
> Hi
> The first part might sound like I am in the wrong group, but bear with 
> me...
> (I probably am, but I googled up and down RAID and LVM lists and I am 
> still  stuck):
> I have a software RAID 5 with 4 disks and LVM on top. I had one volume 
> group with two logical volumes (for root and data).
> I wanted to upgrade capacity and started by failing a drive, replacing 
> it with a bigger one and let the RAID resync. Worked fine for the 
> first disk. The second disk apparently worked (resynced, all looked 
> good), but after a reboot the system hung.
> After some back and forth with superblocks (on the devices, never on 
> the array) I was able to re-assemble the array clean.
> The system still does not reboot though: "Volume group "cmain" not found".
>
> I booted a live cd, assembled the array and did a pvck on the array 
> (/dev/md0):
> "Could not find LVM label on /dev/md0"
> pvdisplay /dev/md0 results in:
>   No physical volume label read from /dev/md0
>   Failed to read physical volume "/dev/md0"
>
> I do not have a backup of my /etc/ and therefore no details regarding 
> the configuration of the LVM setup (yes, I know...)
> All I have of the broken system is the /boot partition with its content
>
> Several questions arise:
> - Is it possible to "reconstitute" the LVM with what I have?
> - Is the RAID array really ok, or is it possibly corrupt to begin with 
> (and the reason no LVM labels are around)?
> - Should I try to reconstruct with pvcreate/vgcreate? (I shied away 
> from any *create commands to not make things worse.)
> - If all is lost, what did I do wrong and what would I need to backup 
> for a next time?
>
> Any ideas on how I could get the data back would greatly be 
> appreciated. I am in way over my head, so if somebody knowledgeable 
> tells me: "you lost, move on" would be bad, but at least would save me 
> some time...
>
> Thanks,
> Andreas
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--------------080008040003010703050708
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    Don't think I'm much of an expert in this area, but I had a similar
    issue that I worked through last week. I wasn't using mdadm, but I
    don't really think this is a situation that is really relevant to
    that.<br>
    <br>
    I posted the question on serverfault and got enough help to get me
    through it. You can see it here:<br>
    <a
href="http://serverfault.com/questions/275679/rescue-disk-is-unable-to-see-the-lvm-physical-volumes">http://serverfault.com/questions/275679/rescue-disk-is-unable-to-see-the-lvm-physical-volumes</a><br>
    <br>
    The suggestion that got me on the right track seems to be very
    similar to your situation. How to recover your lvm configuration
    with mdadm.<br>
    <a
      href="http://www.howtoforge.com/recover_data_from_raid_lvm_partitions">http://www.howtoforge.com/recover_data_from_raid_lvm_partitions</a><br>
    <br>
    The steps I went through were basically:<br>
    * Recover config using dd per steps in that article<br>
    * Recreate the physical volume using the same device<br>
    * Do a pvcfgrestore on the recovered config from step 1<br>
    <br>
    That got me back up and running. I hope it helps.<br>
    <pre class="moz-signature" cols="72">Anthony Nelson
Affinity Global Solutions
701.223.3565 Ext: 13
</pre>
    <br>
    On 6/5/2011 7:47 AM, Andreas Schild wrote:
    <blockquote
      cite="mid:BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com"
      type="cite">Hi
      <div>The first part might sound like I am in the wrong group, but
        bear with me...</div>
      <div>(I probably am, but I googled up and down RAID and LVM lists
        and I am still  stuck):</div>
      <div>I have a software RAID 5 with 4 disks and LVM on top. I had
        one volume group with two logical volumes (for root and data).</div>
      <div>I wanted to upgrade capacity and started by failing a drive,
        replacing it with a bigger one and let the RAID resync. Worked
        fine for the first disk. The second disk apparently worked
        (resynced, all looked good), but after a reboot the system hung.</div>
      <div>After some back and forth with superblocks (on the devices,
        never on the array) I was able to re-assemble the array clean.</div>
      <div>The system still does not reboot though: "Volume group
        "cmain" not found".</div>
      <div><br>
      </div>
      <div>I booted a live cd, assembled the array and did a pvck on the
        array (/dev/md0):</div>
      <div>"Could not find LVM label on /dev/md0"</div>
      <div>
        <div>pvdisplay /dev/md0 results in:</div>
        <div>  No physical volume label read from /dev/md0</div>
        <div>  Failed to read physical volume "/dev/md0"</div>
      </div>
      <div><br>
      </div>
      <div>I do not have a backup of my /etc/ and therefore no details
        regarding the configuration of the LVM setup (yes, I know...)</div>
      <div>
        All I have of the broken system is the /boot partition with its
        content</div>
      <div><br>
      </div>
      <div>Several questions arise:</div>
      <div>- Is it possible to "reconstitute" the LVM with what I have?</div>
      <div>- Is the RAID array really ok, or is it possibly corrupt to
        begin with (and the reason no LVM labels are around)?</div>
      <div>- Should I try to reconstruct with pvcreate/vgcreate? (I
        shied away from any *create commands to not make things worse.)</div>
      <div>- If all is lost, what did I do wrong and what would I need
        to backup for a next time?</div>
      <div><br>
      </div>
      <div>Any ideas on how I could get the data back would greatly be
        appreciated. I am in way over my head, so if somebody
        knowledgeable tells me: "you lost, move on" would be bad, but at
        least would save me some time...</div>
      <div><br>
      </div>
      <div>Thanks,</div>
      <div>Andreas</div>
      <div><br>
      </div>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
  </body>
</html>

--------------080008040003010703050708--
