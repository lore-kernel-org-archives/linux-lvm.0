From: GCS <gcs@lsc.hu>
Subject: Re: [linux-lvm] Kernel 2.4.12 bug?
Message-ID: <20011024121140.A3783@lsc.hu>
References: <20011020111357.A13288@lsc.hu> <20011022094833.B557@tykepenguin.com> <20011024082146.A3130@lsc.hu> <20011024090009.A577@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011024090009.A577@tykepenguin.com>; from caulfield@sistina.com on Wed, Oct 24, 2001 at 09:00:09AM +0100
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
Date: Wed Oct 24 04:58:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 24, 2001 at 09:00:09AM +0100, Patrick Caulfield <caulfield@sistina.com> wrote:
> Are you swapping onto the LV ? It seems that swapoff -a does not remove the LV
> from the list of swap partitions, so vgchange -an would either fail or pull the
> rug out from underneath the paging mechanism.
 Not at all. LVM is on a 61.5Gb IBM disk, and my swapp is on a standard
partition, on an other disk. Ok, it happens after I get 'swapp is turned off'
message on the console. Thus if it is related to swapp, then it is a
software bug somewhere, as my swapp is nothing to do with LVM. If you want,
I can try my config without swapp. I mean remove it from fstab, reboot and see.
Also, do you have an idea for the boot time problem: buffer is busy message?
Thanks,
GCS
