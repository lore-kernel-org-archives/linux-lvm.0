From: Anders Widman <andewid@tnonline.net>
Message-Id: <16815374406.20020304234521@tnonline.net>
Subject: Re: [linux-lvm] Manegeability with LVM
In-Reply-To: <20020304223441.GA3489@localhost>
References: <2712663015.20020304230010@tnonline.net>
    <20020304223441.GA3489@localhost>
MIME-Version: 1.0
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
Date: Mon Mar  4 16:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> On Monday, 04 March 2002, at 23:00:10 +0100,
> Anders Widman wrote:

>> As my need for diskspace increases all the time I was thinking of
>> using LVM so I could make use of all diskspace and grow/shrink/replace
>> drives as I need to.
>> 
> Take into account that there are filesystem that by design doesn't
> support shrinking of filessytems (e.g. XFS). Some others allow you to
> both grow and shrink filesystems, but sometimes you will have to unmount
> the filesystem before modifying its size.

Yes, very true. I was thinking of using reiserfs which supports at
least offline resizing/shrinking.

> On the LVM part, it was designed to allow growing and reducing LV sizes
> without being necessary to put your machine in some "maintenance" state.

>> The only downside to this is the possibility of massive dataloss if I
>> loose any of the 14 disks (drive fails to spin etc...). Would it be
>> possible to setup up a software redundancy like RAID5 with LVM so I
>> can keep this manageability LVM gives me?
>> 
> Remember, nothing except regular _and_ verified backups of your valuable
> data can guarantee that your data will survive a hardware _or_ software
> error. I'm am not sure what I fear most, a damaged disk or a severe 
> filesystem corruption. Some RAID levels give you additional hardware
> failure protection, but other levels increase your chances of lossing
> data. LVM can be seen as some sort of linear-RAID, and as such, usually
> increases the probability of a broken disk destroying your data.

> In other words, backups are (and will always be) the way to go.

True. I do agree. Right now I don't have the "economy" to buy
additional hardware so I have to do the best thing with these drives
(with the possibility to add new ones or replace old ones for bigger
drives.).

//Anders
