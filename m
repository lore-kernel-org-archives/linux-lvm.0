Received: from [10.36.4.34] (vpn1-4-34.ams2.redhat.com [10.36.4.34])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o39JtdvS020909
	for <linux-lvm@redhat.com>; Fri, 9 Apr 2010 15:55:39 -0400
Message-ID: <4BBF863A.8030508@redhat.com>
Date: Fri, 09 Apr 2010 21:55:38 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4BBBBA47.5040006@tlinx.org>
	<20100407052739.GA16693@maude.comedia.it>
In-Reply-To: <20100407052739.GA16693@maude.comedia.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Error
 message:lib64/libdevmapper-event-lvm2snapshot.so.2.02: undefined symbol:
 lvm2_run
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
To: linux-lvm@redhat.com

On 7.4.2010 07:27, Luca Berra wrote:
> On Tue, Apr 06, 2010 at 03:48:39PM -0700, Linda A. Walsh wrote:
>>
>> I am trying to run a 2.6.33.1 kernel with a Suse11.2 runtime, which
>> I think uses a 2.6.31.12 kernel.
>>
>> Has some user-space library changed that I need to rebuild so I can use
>> the newer kernel, or ---
>>     WHAT the heck is going on?! :-)
>>
>> Entire error message (and related messages) from logs:
>>
>> Home-2010.04.05--18.00.01: event registration failed: 22892:9
>> libdevmapper-event-lvm2snapshot.so.2.02 dlopen failed:
>> /lib64/libdevmapper-event-lvm2snapshot.so.2.02: undefined symbol:
>> lvm2_run
>>  Home/snapshot0: snapshot segment monitoring function failed.
>>
>> Thanks for any pointers in telling me how to go about fixing this
>> new snafu!
>> Sigh...
>> Suse 11.2 has been such a pain to upgrade to!
> looks like underlinking of libdevmapper-event-lvm2snapshot.so.2.02
> it should be linked to liblvm2cmd.so.2.02
> open a bug report vs your vendor

Yes there are ongoing cleanups of linkage process, to keep the amount
of linked libraries at minimum level.

libdevmapper-event-lvm2.so.2.02 should have dependency on liblvm2cmd.so.2.02.

See  WHATS_NEW/2.02.59 for the reason of libdevmapper-event-lvm2.

Zdenek
