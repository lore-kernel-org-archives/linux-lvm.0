Subject: Re: [linux-lvm] filesystem does not reflect new LV size
References: <200206061901.g56J1ri21368@bach.leonora.org>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: "Vladimir G. Ivanovic"'s message of "Thu, 06 Jun 2002 12:01:53 -0700"
Message-ID: <ufar8jk6x7v.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
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
Date: Thu Jun  6 14:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "VGI" == Vladimir G Ivanovic <vladimir@acm.org> writes:

VGI> Well, I ran with the bit between my teeth....

I didn't have problems running resize2fs (actually e2fsadm to change
both the LV and filesystem in one go) on plain ext3 without playing
with the journal.  You have to unmount it as ext2online doesn't work,
but I was able to grow and shrink an umounted ext3 filesystem
containing data with no problems.  Was I just lucky?

 - J<
