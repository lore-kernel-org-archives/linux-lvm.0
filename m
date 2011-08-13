Date: Sat, 13 Aug 2011 23:53:30 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110813225330.GA6019@agk-dp.fab.redhat.com>
References: <CAA-yEOLgSqD7N5C773M=54CmVy8=aYybkw1AWOhWmZgc+ET68Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA-yEOLgSqD7N5C773M=54CmVy8=aYybkw1AWOhWmZgc+ET68Q@mail.gmail.com>
Subject: Re: [linux-lvm] lvm hangup on snapshot overflow
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
To: Pasha Z <free.lan.c2.718r@gmail.com>
Cc: linux-lvm@redhat.com

On Fri, Aug 12, 2011 at 07:05:31PM +0300, Pasha Z wrote:
> lvconvert device-mapper: suspend ioctl failed: Input/output error
> lvconvert Unable to suspend VG-sn_x (252:3)
> lvconvert Failed to suspend origin lv
 
What exactly are you trying to do with lvconvert rather than lvcreate?

Never let snapshots fill up - use dmeventd instead and intervene in
a controlled way before they are full.

The lvconvert -s man page is too subtle and needs improving.

Alasdair
