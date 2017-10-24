Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <0bed0c25-ed17-1862-eeaa-860c84e07b4d@yahoo.co.uk>
Date: Tue, 24 Oct 2017 14:45:59 -0500
Message-Id: <DB5D3605-AC6B-41C2-843D-93D39FBAFED3@redhat.com>
References: <f0cb5c37-29b1-e9d6-30ae-a0b5800f65d6@yahoo.co.uk>
	<0bed0c25-ed17-1862-eeaa-860c84e07b4d@yahoo.co.uk>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm raid: pvmove vs lvconvert
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

You could use either, I suppose.  The replace will pull out the RAID member and replace it with a new one.  pvmove will create a temporary mirror for the member being moved.  I don’t think it makes a huge difference which you use, but I would tend to use ‘lvconvert --replace’ when working with RAID segment types.

 brassow



> On Oct 18, 2017, at 9:54 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
> 
> 
> 
> On 18/10/17 15:42, lejeczek wrote:
>> hi there
>> 
>> in lvm raid LVs, which one should be used and how do they differ - would you know? Are they meant for different things?
>> 
> sorry, I'm thinking specifically of: lvconvert --replace VS pvmove
> 
>> many thanks, L.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
