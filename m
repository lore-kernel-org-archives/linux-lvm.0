Return-Path: <mason@suse.com>
Date: Thu, 07 Dec 2000 15:05:08 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <700130000.976219508@coffee>
In-Reply-To: <20001207115538.B24318@archimedes.oak.suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Thursday, December 07, 2000 11:55:38 -0800 David Gould <dg@suse.com>
wrote:

> On Thu, Dec 07, 2000 at 03:39:11AM -0800, Tracy R Reed wrote:
>> 
>> [root@computer /usr2]# mount -t reiserfs /dev/vg-sdb1/snapshot /snap/
>> mount: block device /dev/vg-sdb1/snapshot is write-protected, mounting
>> read-only mount: wrong fs type, bad option, bad superblock on
>> /dev/vg-sdb1/snapshot, or too many mounted file systems
> 
> Unless they have changed it (possible), reiserfs does not support ro
> hardware for mounting unless the filesystem was unmounted cleanly. The
> reason is that to make the FS consistant the journal has to be replayed
> which necessarily _writes_ to the device. This cannot work on an ro
> device.
> 

We didn't change that ;-)  But, the message would look different.  In this
case, it did not find a reiserfs filesystem at all, or perhaps the reiserfs
module wasn't loaded...

-chris
