Date: Tue, 22 Mar 2005 23:26:17 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Can't restore the volume group after ghosting an hdd
Message-ID: <20050322232617.GR19749@agk.surrey.redhat.com>
References: <e5146c2a05032215124af3c0d7@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5146c2a05032215124af3c0d7@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sasha Z <kleptophobiac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Mar 22, 2005 at 06:12:46PM -0500, Sasha Z wrote:
>   Found duplicate PV iCXUP4rdy2ZhoIJ4NWl1s3dr1au6QofX: using /dev/hdg1
> not /dev/hdg
>   Found duplicate PV fFNJ9uKeNSMVQxwLH82lnI3J0hQYRKTh: using /dev/hdk1
> not /dev/hdk

Which of those devices is intended to hold the PV?

Did you run commands against hdg or hdg1?
(If it's partitioned you should always use hdg1, never hdg.)

Updating to a recent version of the lvm2 tools will help avoid that
in future.  Meanwhile it might be that you need to wipe the partition 
tables (the 1st 512 bytes of hdg and hdk - back it up first).

Alasdair
-- 
agk@redhat.com
