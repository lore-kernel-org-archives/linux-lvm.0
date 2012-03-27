Message-ID: <4F7224E8.7080305@redhat.com>
Date: Tue, 27 Mar 2012 22:36:56 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F6ECF9B.40907@nuclearwinter.com>
	<20120326155540.19c85fe9@bettercgi.com>
	<4F71CF55.4020706@redhat.com>
	<20120327131113.5d11b5c3@bettercgi.com>
In-Reply-To: <20120327131113.5d11b5c3@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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
To: Ray Morris <support@bettercgi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 27.3.2012 20:11, Ray Morris napsal(a):
>>> so it was checking LVs to see if they
>>> were PVs ...
>>> The solution was to use "filter" in lvm.conf like this:
> 
>> Could you check upstream  CVS version of lvm2 with 2 extra patches:
>> (not yet upstream)
>>
>> https://www.redhat.com/archives/lvm-devel/2012-March/msg00171.html
>> https://www.redhat.com/archives/lvm-devel/2012-March/msg00172.html
>>
>> Whether your slow PV operations are solved ?
> 
> Patch #2 seems to apply when they are a lot of PVs. In our case, we 
> have very few PVs and a lot of LVs, so I don't think it would affect
> us. Patch #1 is a bit less clear to me. Is it applicable to an
> environment with few PVs? 

I'm interested in the case which takes  'hours' according to your email. I'm
aware of some problems if you specify extra parameters on command line (i.e.
list of PVs on command line), but generic commands with arguments that selects
just some vg/[lv] should be already working with decent speed (at least with
recent enough version).

Actually which version of lvm is slow for you?
If you are able to reproduce your problems with current upstream - could you
try to describe exact workflow of your slow commands (how many PVs, VGs, LVs)?

Zdenek
