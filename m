Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 8 Feb 2001 09:31:23 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] the curious case of the semi-created Logical Volume
Message-ID: <20010208093123.B529@tykepenguin.com>
References: <m21ytase6y.fsf_-_@andy.off.redeye.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m21ytase6y.fsf_-_@andy.off.redeye.com>; from andy@redeye.com on Wed, Feb 07, 2001 at 03:30:45PM +0000
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

On Wed, Feb 07, 2001 at 03:30:45PM +0000, Andy Cowling wrote:
> SuSE 7.0 with 4 x 8Gb SCSI disks. All filesystems are ext2.
> 
> I have created PV's, VG's and 2 LV's each of 8Gb and created ext2
> filesystems on them and mounted them successfully.
> 
> Now I want to extend 'lv02' to 16Gb but lvextend claims the LV is not
> active. Similarly lvdisplay only lists the LV using '-d'.
> 
> I created this setup using Yast (not the command-line).
> 
> Is there any way to retrieve the situation ? I am not at all familiar
> with LVM configuration files and this is a live system   :-(
> 
> Thanks, as always, for any help.

Can you do a lvdisplay -v on the volume so we can see just why LVM thinks it is
inactive please ?

patrick
