Message-ID: <3DF32C32.4080501@machturtle.com>
From: David Corbin <dcorbin@machturtle.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] I'm confused
References: <3DF2B8D1.7070702@machturtle.com> <20021208040653.GF12437@orthanc>
In-Reply-To: <20021208040653.GF12437@orthanc>
Content-Transfer-Encoding: 7bit
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
Date: Sun Dec  8 05:25:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>>VG Size               109.77 GB
>>    
>>
>
>Your volume group (vg0) is about 110GB (I gather the other 10GB of your
>drive is allocated to other partitions).
>  
>
Well, About 3 gig is other partions, and it appears to me that the other 
7G is lost to making the raid device and various overheads (though that 
sure seems excessive).

>  
>
>>Alloc PE / Size       109 / 436 MB
>>    
>>
>
>You've used up (allocated) 436MB of the volume group
>
>  
>
>>Free  PE / Size       27993 / 109.35 GB
>>    
>>
>
>You have still almost 110GB free (since you allocated only 436MB)
>
>  
>
>>lvscan -- ACTIVE            "/dev/vg0/data" [436 MB]
>>    
>>
>
>Your data partition is the only LV and that is using the 436MB used in
>vg0.
>
>  
>
>>/dev/vg0/data           446444    444448      1996 100% /data
>>    
>>
>
>Your filesystem on /dev/vg0/data is using the entire 436MB of the
>partition. And its full.
>
>  
>
The odd thing is that I'm sure I created the LV at a full 100% of the 
disk...

>What you need to do now is extend your logical volume to allocate more
>space to it. Then resize the filesystem. If you have an ext2/ext3
>filesystem, you use "e2fsadm --size ...". If you have xfs, you use
>"xfs_growfs ...". I dont know about other filesystem types.
>
>eg. to add 10G to your data partition (assuming xfs - that's what I use):
># lvextend --size +10G /dev/vg0/data
># xfs_growfs /dev/vg0/data
>
>df(1) should now show a large filesystem with much more space.
>  
>
I did as you suggested, and used "resize_reiserfs".  It seems better, 
but we shall see if it changes on me again...
