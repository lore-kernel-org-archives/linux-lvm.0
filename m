References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4d31a0bd-4456-aecd-ce19-076b1220fd77@redhat.com>
Date: Sat, 15 Feb 2020 13:40:39 +0100
MIME-Version: 1.0
In-Reply-To: <20200214204028.GB20792@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: heming.zhao@suse.com

Dne 14. 02. 20 v 21:40 David Teigland napsal(a):
> On Fri, Feb 14, 2020 at 08:34:19PM +0100, Gionatan Danti wrote:
>> Hi David, being filters one of the most asked questions, can I ask why we
>> have so many different filters, leading to such complex interactions and
>> behaviors?
>>
>> Don't get me wrong: I am sure you (the lvm team) have very good reasons to
>> do that, and I am surely missing something? But what, precisely? How should
>> we (end users) consider filters? Should we only use global_filter?
> 
> You're right, filters are difficult to understand and use correctly.  The
> complexity and confusion in the code is no better.  With the removal of
> lvmetad in 2.03 versions (e.g. RHEL8) there's no difference between filter
> and global_filter, so that's some small improvement.  But, I think filters
> should be replaced or overhauled with something easier to use and more
> useful at a technical level.
> 
> I've created a bz about that and welcome thoughts about what a replacement
> should or should not be like.  With input the work is more likely to be
> prioritized.
> 

One of the 'reason' for having 2 sets of filter was the presence of universal 
'scanning' tool (aka udev) - which is assessing & reading devices in a system 
and its combination with various 'VM' environments where actual device are 
passed to guest systems on your hosting machine.

So there are many different combinations where different commands may need to 
see different subset of devices - so i.e. your guest machine should not have 
an impact on correctness of your 'hosting' machine no matter what guess will 
write (i.e. duplicating signatures...)

While in many cases for many single home users with single set of devices this 
can be seen maybe as an 'overkill' solution - in the more generic world where 
there is unfortunately not yet any widely used/accepted solution solving the 
core problem: 'who is the owner of a device'  having several sets of filter 
was the only solution we were able to create.

It's worth to note lvm2 is solving way more issues then other similar device 
technology (i.e. mdraid, btrfs....) where it's very simple to cause big 
confusion and data corruptions (even unnoticed) once duplicates appears in 
your system...

Zdenek
