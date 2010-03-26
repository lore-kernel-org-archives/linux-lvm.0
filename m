Message-ID: <4BACFDB7.3010702@davidcoulson.net>
Date: Fri, 26 Mar 2010 14:32:23 -0400
From: David Coulson <david@davidcoulson.net>
MIME-Version: 1.0
References: <4BACC1D0.9090402@davidcoulson.net>
	<20100326161851.GB15016@redhat.com>
	<4BACE0FB.5010703@davidcoulson.net>
	<20100326181613.GA1645@redhat.com>
In-Reply-To: <20100326181613.GA1645@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Auto PV scan w/ LVM
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 3/26/2010 2:16 PM, Mike Snitzer wrote:
> Are you using multipath's 'queue_if_no_path' (assuming RHEL4 has it)?
> Could be LVM's IO to the mpath devices will queue (block) until the
> point when you "break the clone" (which makes the paths(s) available).
>
This seems to be a pretty good solution to the problem - When I set it 
to fail_if_no_path via dmsetup, it seemed to work nicely. Any idea how 
to set this within a multipaths { multipath { wwid xxxx }} config?
