Message-ID: <3FDA1272.8050801@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm support
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D9E@s99mail06>
In-Reply-To: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D9E@s99mail06>
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
Date: Fri Dec 12 13:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Little, Chris wrote:
> Is snapshot now unsupported?  Or am I asking the wrong questions or
> directing to the wrong place.  since it is an option to lvcreate and the
> maintainer lists sistina, i thought this would be the place to ask
> questions.

Can't speak for sistina... but I do agree with your
prior comments about it being buggy and unreliable.
In simple scenarios it seems to work ok... but
we had to use link-farm style solution instead
in order to make our disk based backup cache
work.  Your (well I asuume you had this too) out
of memory condition can be somewhat handled I believe
with a larger memory initrd.... but it's a temporary
fixup at best.... we started running out
of memory again.. just took longer.

Running SUSE 8.2 with 6TB of disk backup area.
