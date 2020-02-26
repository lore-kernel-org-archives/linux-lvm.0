References: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
	<bcd5bb9d-9ea5-69ba-f041-7b0422b48405@redhat.com>
	<bfd3824a-f360-b4ab-9a08-6a51c8c37a94@uwaterloo.ca>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <a4708de8-93f9-e663-3184-099a8e40ac3c@redhat.com>
Date: Wed, 26 Feb 2020 11:01:26 +0100
MIME-Version: 1.0
In-Reply-To: <bfd3824a-f360-b4ab-9a08-6a51c8c37a94@uwaterloo.ca>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] faster snapshot creation?
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
To: Eric Toombs <ewtoombs@uwaterloo.ca>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 25. 02. 20 v 22:35 Eric Toombs napsal(a):
> I tried thin pools and got the same snapshot creation time, about .45s.
> 

As it has been said - lvm2  is NOT only sending couple ioctl() to create snapshot.

Every lvm2 command essentially does a full system validation with respect to 
currently configured set of metadata - this exec-time  by faaaaaar exceeds
the actual snapshot creation time.
(Also snapshot monitoring is pretty 'time expensive' operation on its own)


> I also tried creating the entire vg in memory with losetup and that
> didn't change the creation time either.

lvm2 was never optimized towards 'hyper fast' manipulation with a single 
device - after all you are impacting your system resources in a major way - 
thus couple milliseconds here and there for majority of users doesn't really 
matter.

What is the most important in terms of speed is the 'minimal' delay which can 
be observed on origin being in use (aka 'suspend-resume' time-frame of origin 
takes short amount of time to block actual usage of the origin device - user 
should not see big latency...)

If you are aspiring of creating tens of snapshot per second - you probably 
have very unusual workflow/requirement and mostly likely lvm2 is not the right 
tool for such task ATM.

There used to exist 'slight' optimization where lvm2 executed as 'lvm shell' 
(so you basically stream lvm command though a pipe to such lvmshell) was 
'sharing' some cached content between runs of individual commands - but this 
was mostly lost and most likely would not squeeze a lot the time you refer.

So my advice - if you really need to use and create old snaps in very fast way 
is to developed your very own tool working in you restricted environment where 
you  might probably not care about meta/data consistencies, deal with speed of 
udev and gazillion other issues - you can run your small 'ioctl()' stream much 
more efficiently.

On the other hand it's well beyond my imagination what is good for 'very fast' 
creation of a snapshot when the overall performance of the system is then 
degraded by 50% or more...  but user can choice...


Zdenek
