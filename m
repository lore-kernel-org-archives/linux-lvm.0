Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6KCVQhp026605
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2004 13:31:26 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BmtmJ-000367-AW
	for linux-lvm@redhat.com; Tue, 20 Jul 2004 13:31:27 +0100
Date: Tue, 20 Jul 2004 13:31:27 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] unable to create permanent physical volume on /dev/hdc
Message-ID: <20040720123127.GE2980@tykepenguin.com>
References: <40FCFE72.9030106@pi.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40FCFE72.9030106@pi.be>
Sender: Patrick <patrick@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 20, 2004 at 01:13:54PM +0200, David Claessens wrote:
> Hi,
> 
> I have a machine with 4 disks assigned to LVM. I recently re-installed 
> this machine and upgraded it to a custom compiled 2.6 kernel (2.6.7 to 
> be specific) but now I'm having troubles recreating my LVM. I have 
> assigned /dev/hda6, /dev/hdb, /dev/hdc en /dev/hdd to LVM with the 
> 'pvcreate' command without any error (I did run the dd command from the 
> howto first). When I run 'pvs' I see my 4 physical volumes, however when 
> I run 'pvscan' it only lists 3 of the 4 physical volumes. /dev/hdc is 
> missing from the list. When I run 'pvs' again it now also only shows 3 
> of the 4 physical volumes. However if I run 'pvs /dev/hdc' it shows me 
> my 4 physical volumes, 'pvscan' always shows only 3. Also after running 
> 'pvscan', I can run 'pvcreate' again on /dev/hdc without any error and 
> running 'pvs' without any arguments will show 4 volumes.
> 
> I have no problems creating a primary partition spanning the disk. 
> However running 'pvcreate /dev/hdc1' also works without an error but it 
> still won't show up in a pvscan. What could be the problem that hdc 
> won't be a physical volume or what commands could/should I run to more 
> accurately debug/fix the problem ??
> 
> The system is running on Debian 3.0 upgraded to testing and I have a 
> duplicate with the same setup that is running without any problem. Also 
> LVM2 is working perfectly using the 3 working physical volumes.

Check the config file (/etc/lvm/lvm.conf) for filters. By default /dev/cdrom is
filtered out on Debian systems and this often gets mapped to /dev/hdc. Which
would cause those symptoms.

Simply comment out the active "filter = " line and run vgscan.

-- 

patrick
