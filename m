Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 2 Aug 2001 15:28:23 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Problem with vgimport/export
Message-ID: <20010802152823.C575@tykepenguin.com>
References: <3B680D93.53F3122B@searchengine.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B680D93.53F3122B@searchengine.com>; from dave@searchengine.com on Wed, Aug 01, 2001 at 02:09:23PM +0000
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Aug 01, 2001 at 02:09:23PM +0000, Dave wrote:
> Hi,
> 
> I have a machine with one boot disk and an LVM (0.9.1_beta2) array of 3
> hardware RAID boxes. The boot disk, a non-LVM IDE drive recently started
> locking up. I guessed it was about to fail (the clicking noises sort of gave
> that away), so I figured I'd install a new disk. I checked out the LVM HOWTOs
> with regards to moving the LVM array to a different machine (which I assume
> also applies to replacing a broken boot disk in a machine, effectively moving
> the array to a new system). I deactivated and exported the array successfully.
> As a test, I tried re-importing it right after exporting it. No luck!
> "vgimport comms /dev/sd[abc]1" gave error 14 and told me "vgimport -- ERROR
> "vg_read(): PV" reading data of volume group "comms".
> I didn't have much chance to try anything else as the hard-drive crashed
> unrecoverably a few minutes later.
> 
> So, I installed SuSE 7.1 (and upgraded the kernel from 2.4.0 to 2.4.7) on a
> new IDE drive and booted the machine. I still cannot get the vg to be
> recognized. According to the FAQ, the vgimport command should have done
> everything for me. Why could it not even import an array it had *just*
> exported, never mind doing it on another machine?...
> 
> I've looked through the mailing list for solutions to my problem, but nothing
> I've tried has been successful. The import/export FAQ said nothing of
> /etc/lvmtab or /etc/lvmtab.d/* files, and these are unavailable now as the
> previous hard-drive cannot be mounted or even read from. I've tried the
> contrib tool "uuid_fixer", and it seemed to run OK, but didn't fix the
> problem.
> 
> I upgraded LVM to 0.9.1_beta8 (kernel patches and user tools), but then pvscan
> wouldn't even work, so I downgraded back to the SuSE-supplied version
> (0.9.1_beta2). At least I can see the PVs now!

I don't know what vgimport should fail like that. vgscan and pvscan are behaving
normally though. Can you do a "vgimport -d  comms /dev/sd[abc]1" and send me the
output please.


patrick
