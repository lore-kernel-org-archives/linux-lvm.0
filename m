Message-ID: <3560BA143F45D5118E670000E82459214C1D8E@ssk.schneiderkenzingen.de>
From: "Koch, Steffen" <steffen.koch@sphinx-electronics.de>
Subject: RE: [linux-lvm] lvm and md
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
Date: Fri Mar  7 08:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> Should we build lvm volumns on top of soft raid(md) or build 
> md on top of lvm volumns?
> I prefer to build md on top of lvm volumns because lvm can hide the 
> hardware details from md. Just want to know how do you think 
> about this.
> Or any URLs? Thanks.

How do you achieve redundancy with this setup? How would you know on which
disks your LVs are when building the raid??
