From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] RE:
Message-ID: <20020730214410.A8789@uk.sistina.com>
References: <E04CF3F88ACBD5119EFE00508BBB212103B7EA2F@exch-01.noida.hcltech.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E04CF3F88ACBD5119EFE00508BBB212103B7EA2F@exch-01.noida.hcltech.com>; from amitag@noida.hcltech.com on Tue, Jul 30, 2002 at 10:35:44AM +0530
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
Date: Tue Jul 30 15:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amitag@noida.hcltech.com
Cc: linux-lvm@sistina.com

On Tue, Jul 30, 2002 at 10:35:44AM +0530, Amit  Agrawal, Noida wrote:
> 			Would you please help by suggesting the changes
> required in LVM internal data structures to make LV's greater than 2TB on 32
> bit machine for 2.4.18 kernel. As far as kernel limitations are there we
> have removed them all and want lv's greater than 2TB also.

Well if you've already made the necessary kernel-side changes, don't
you simply want to take the same approach to the userspace code, looking
for any fields that need to grow and for references to the 2TB limit?

The comments in the code suggest there shouldn't be much more needing
changing except for the hard-coded limitations like LVM_LV_SIZE_2TB.

But don't forget to choose large PEs of course - up to 16GB!

Alasdair
-- 
agk@uk.sistina.com
