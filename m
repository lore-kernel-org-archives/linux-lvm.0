From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xwu7w4v1y.fsf@kth.se>
References: <20040112153912.1530c7d3.luca.ferroni@studio.unibo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: df and lvs incompatible output
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
Date: Mon Jan 12 18:17:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Luca Ferroni <luca.ferroni@studio.unibo.it> writes:

> Hi all,
> I use LVM2 on my laptop, and I have one volume group called "mio_vg"
>
> I extended my Logical Volume lv_usr and I experienced some problems:
> according to LVM2 (lvs output) my lv_usr is 7,5G, whereas with df
> its size seems to be 4,0G.

Most likely, you didn't also extend the filesystem inside the LV.

-- 
M�ns Rullg�rd
mru@kth.se
