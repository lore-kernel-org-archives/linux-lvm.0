Message-ID: <3DDAB38C.8050204@backflip.com>
From: Kenny Gorman <kgorman@backflip.com>
MIME-Version: 1.0
References: <3DDAA535.3030206@backflip.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: LVM and mounting
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
Date: Tue Nov 19 15:56:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Just to add to this (I am not sure if this hit the list anyways, I just 
subscribed).

I am running SuSE 2.4.16-64GB, and lvm 1.0.<something, can't get on the 
box to verify@this point...>

-kg

Kenny Gorman wrote:
> I am having a problem where when I boot up the machine, the machine says 
> I need to fsck one of my logical volumes.  This volume I just added a 
> new filesystem to, but it hung on mount, so I rebooted.  Then I tried to 
>  lvremove the volume, and it says it successfully removed it, then I am 
> running vgchange -a n <grp> and vgremove <grp>.  But it says I can't 
> remove the group.. because it belongs to a volume.
> 
> I think my lvmtab or someting is all messed up because the some messages 
> seem to indicate that the volume is there, and some say it's not. 
> lvdisplay says it does not exist.
> 
> I would just like to remove the entire volume and group and start over 
> so I can get my machine to boot.  Is there some option to just 'ignore' 
> or 'force' destroy the volume?  If I fdisk the disk will I still get 
> this error?
> 
> Any help would be great!!
> 
> thx
> -kg
> 
