References: <CH2PR18MB3206CB2E1FB879E424FCA2BACFF00@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <c6f91be7-fc45-3233-315d-70e1bc8eb9cc@redhat.com>
Date: Wed, 10 Jul 2019 14:47:57 +0200
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB3206CB2E1FB879E424FCA2BACFF00@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Which lvm2 code branches are important?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

On 7/10/19 8:42 AM, Gang He wrote:
> Hello List,
> 
> After you clone the code from git://sourceware.org/git/lvm2.git, you can find lots of remote code branches.
> But which code branches are important for the third party users/ developer? That means we should monitor these code branches.
> For example,
> Which code branches are main (or long-active) code branches?
> Which code branches are used for which lvm2 products (big versions)?

master - 2.03 branch, new features land here,
stable-2.02 - legacy 2.02 branch, bug fixes mostly.

> What are the main differences between different lvm2 products? E.g. some features are added/removed.

2.03 vs 2.03:

- dropped lvmetad and clvmd,
- added handling of writecache and VDO targets.

> 
> 
> Thanks a lot.
> Gang
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
