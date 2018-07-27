MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23387.29464.233937.89557@quad.stoffel.home>
Date: Fri, 27 Jul 2018 15:31:36 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <20180727182658.GI23157@merlins.org>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
Subject: Re: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

>>>>> "Marc" == Marc MERLIN <marc@merlins.org> writes:

Marc> Hi Zdenek,
Marc> Thanks for your helpful reply.

Marc> On Fri, Jul 27, 2018 at 02:59:28PM +0200, Zdenek Kabelac wrote:
>> Dne 26.7.2018 v 18:31 Marc MERLIN napsal(a):
>> >Still learning about thin volumes.
>> >Why do I want my thin pool to get auto extended? Does "extended" mean
>> >resized?
>> 
>> yes   extension == resize
 
Marc> Gotcha. Then I don't want to have to worry about my filesystem being resized
Marc> multiple times, especially since I'm not sure how it will help.
 
>> man lvmthin.
 
Marc> Thanks. Had read it, but not carefully enough.
Marc> So, I just re-read "Automatic extend settings"
Marc> I'm still I'm not entirely sure how using extension would help me there. I
Marc> can't set it to 10% for all 10 filesystems (50% is minimum).
Marc> If I set it to anything less than 100%, it could later that it can block,
Marc> and try to extend and resize later, but ultimately I'll still have multiple
Marc> filesystems that together exceed the space available, so I can run out.
Marc> I'm not seeing how the automatic extend setting is helpful, at least in my case.
Marc> Am I missing something?

Marc> To be clear, my case is that I will have 10 filesystems in a
Marc> place where the same data was in a single filesystem that sadly
Marc> I must segment now. More than a few will take more than 1/10th
Marc> of the space, but I don't want to have to worry about which ones
Marc> are going to use how much as long as all together they stay
Marc> below 100% of course.

Marc> I don't want to have to manage space for each of those 10 and
Marc> have to resize them by hand multiple times up and down to share
Marc> the space, hence dm-thin.

Why don't you run quotas on your filesystems?  Also, none of the
filesystems in Linux land that I'm aware of supports shrinking the
filesystem while live, it's all a unmount, shrink FS, shrink volume
(carefully!) and then re-mount the filesystem.

But again, I think you might really prefer quotas instead, unless you
need complete logical seperation.

John
