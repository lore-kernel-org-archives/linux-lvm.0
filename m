Date: Fri, 26 Aug 2016 11:46:30 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20160826104629.GA11968@hex>
References: <20160826042022.GS1534@subspacefield.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160826042022.GS1534@subspacefield.org>
Subject: Re: [linux-lvm] automatic repartitioning of devices in
 /etc/lvm/cache/.cache?
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
Cc: linux-lvm-request@redhat.com

On Thu, Aug 25, 2016 at 09:20:22PM -0700, travis+ml-linux-lvm@subspacefield.org wrote:
> Hello, I've got a persistent problem in that the second two disks of my array
> occasionally have their heads wiped, with a GPT showing up at the beginning
> of the partition, with the same partitioning structure as the main disk GPT.

Use audit, systemap, or even blktrace to constantly monitor the devices and
report when something is writing to the MBR area.

There have been several common proprietary applications that have been found
to at times cause this type of problem (proprietary RDBMS, volume and cluster
managers in particular).

If you have a Red Hat subscription you may find relevant knowledge base
articles in the portal:

  https://access.redhat.com/

Otherwise you can search through the mailing list archives - there have
been a few threads discussing similar problems.

> Is there any way that being listed there could be a side effect, or be
> a cause, of disk partition corruption in those devices?

Only if some external (non-lvm2) component were reading that file and
acting on the contents. Nothing in lvm2 itself even knows how to write
a GPT partition table.

Regards,
Bryn.
 
