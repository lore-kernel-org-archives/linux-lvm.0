Message-ID: <493E48DE.3070705@redhat.com>
Date: Tue, 09 Dec 2008 10:30:54 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] shift PV from disk to raid device?
References: <VA.000034ec.0056c987@news.conactive.com>
In-Reply-To: <VA.000034ec.0056c987@news.conactive.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>

Kai Schaetzl wrote:
> If possible I would like to avoid wiping the complete PV, recreating all 
> of it and copying all the content of the logical volumes back to it.
> Is there a way to "shift" the PV from /dev/sda to /dev/md2 and leave 
> everything else intact? Maybe after breaking the array?

man pvmove

Bryn.
