From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] How do I do RAID 4/5 *and* LVM?
Message-ID: <20020521180950.C24511@golem.blacknet.de>
References: <3CEA6695.4000100@uci.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CEA6695.4000100@uci.edu>; from newman@uci.edu on Tue, May 21, 2002 at 08:24:05AM -0700
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
Date: Tue May 21 11:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 21 '02 at 08:24, Dave Newman wrote:
> I have four 160 GB IDE disks, and wanted to install software RAID 4/5 
> *and* LVM, and wanted to ask a couple of brief questions:
LVM on top of MD works very well, I'm using it on all my boxes with soft
RAID. (MD == multiple discs == linux soft raid)

dooing MD on top of LVM is possible too, but makes no scense (IMHO)

OTOH if you just want one big partition (3x160GB) than there is no need
for LVM.

> a) Do I need LVM if I want to see a single partition (or can RAID do 
> this for me)?
No, MD will do

> b) Do I first install RAID, then LVM?  Are there any difficulties with 
> these installs?  (I have already successfully done LVM on its own)
yes, first RAID than LVM, no problems to be expected.
 
> c) Are there any reasons why I shouldn't use both RAID and LVM?
No

Cu,
    Goetz
