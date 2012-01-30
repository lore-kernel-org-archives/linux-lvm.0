Date: Mon, 30 Jan 2012 09:43:37 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20120130094336.GA4264@ubuntu>
References: <20120127025701.GB16767@agk-dp.fab.redhat.com>
	<A0D9F519724C4648B433C8FA859E3EBB7CD0390C@EX01.sogou-inc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A0D9F519724C4648B433C8FA859E3EBB7CD0390C@EX01.sogou-inc.com>
Subject: Re: [linux-lvm] =?utf-8?b?562U5aSNOiBOZXcgTFZNMiByZWxlYXNlIDIuMDIu?=
 =?utf-8?q?89=3A_Thinly-provisioned_logical=3Fvolumes?=
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>, "lvm-devel@redhat.com" <lvm-devel@redhat.com>

On Mon, Jan 30, 2012 at 06:29:54AM +0000, Kirby Zhou wrote:
> Can the thinly-provisioned logical volume automatically return its owned space to the pool?
> I mean, if I create a huge file on the logical volume, then delete it, will the logical volume actual space size be reduced automatically?
> If not, how can it be shrinked?


Discard support is currently in testing.  Should go upstream soon.

- Joe
