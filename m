From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Disc crash, want to recover some data... PLEASE
 HELP!
Message-ID: <76580000.1041228785@[192.168.200.4]>
In-Reply-To: <20021230024410.GA32395@barbabok.barbanet.com>
References: <20021230024410.GA32395@barbabok.barbanet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Mon Dec 30 00:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> I saw something about
>
> vgchange -a y -q n /dev/vg

Try exporting the inactive volume group and then building/
importing a new vg with the live disks.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
