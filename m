From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] HELP: vgscan segfaults
Message-ID: <20030129151819.GE802@tykepenguin.com>
References: <20030129151209.GB2200@elrond.lohmann-services.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030129151209.GB2200@elrond.lohmann-services.de>
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
Date: Wed Jan 29 09:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 29, 2003 at 04:12:09PM +0100, Peter Lohmann wrote:
> Hi folks!
> 
> I cannot access my lv's anymore, because vgscan segfaults.
> I used Knoppix (2.4.20 Kernel) yesterday - it worked fine.
> But today, when I try to do a vgscan -v i get the following output:
> 
> root@tty1[/]# vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d" 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- reading data of volume group "myvg" from physical volume(s)
> Segmentation fault
> 
> As i said, yesterday it worked fine?!?
> 
> I'm using debian packages lvm-common 1.5.5 and lvm10 v. 1.0.4-6

Are there any kernel messages (dmesg) ?

patrick
