Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p56DKqKZ011107
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 09:20:52 -0400
Received: from SRVHW174.kao.sbwinfra.nl (static.kpn.net [193.172.150.88] (may
	be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p56DKnbS003778
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 09:20:50 -0400
Received: from srvhw138.KAO.SBWINFRA.NL ([10.1.2.29])
	by SRVHW174.kao.sbwinfra.nl (8.14.4/8.14.4) with ESMTP id
	p56DL2S4030805
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 15:21:03 +0200
Message-ID: <4DECD447.4070006@fundeon.nl>
Date: Mon, 06 Jun 2011 15:21:11 +0200
From: Ger Apeldoorn <g.apeldoorn@fundeon.nl>
MIME-Version: 1.0
References: <BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com>
In-Reply-To: <BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



On 06/05/2011 02:47 PM, Andreas Schild wrote:
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
Have you tried 'vgscan -vvv' and 'pvscan -vvv' when started from a 
usb-stick or bootable dvd-rom? It might give you some more info. (post 
it here)

Ger.
