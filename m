Message-ID: <3DB7685C.9010901@emco.dyndns.org>
From: Emmanuel <eman@emco.dyndns.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgimport problem
References: <3DB72212.3030407@emco.dyndns.org> <1035427592.16111.7.camel@ubergeek>
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
Date: Wed Oct 23 22:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I hadn't thought of re-exporting; I'll have to see what happens on a 
test machine.

I don't actually physically move anything. I exported because I wanted a 
fresh RH install (not an upgrade). I figured once the install was 
completed, I could import and be on my way. Unfortunately, I backed up 
/etc to one of the LVs ...smart thinking, I know :(

Austin Gonyou wrote:
> Could you try to re-export it? just curious..but why did you export it
> in the first place? Were you physically moving it, or just re-installing
> RH?
> 
> 
> On Wed, 2002-10-23 at 17:26, Emmanuel wrote:
> 
>>Hello,
>>
>>I'm having trouble importing my VG after an export.
>>
>>The system that exported the group was Redhat 7.3, I'm trying to import
