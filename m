From: Kai Weber <lists@glorybox.de>
Subject: Re: [linux-lvm] vgscan messages regarding read-only cdrom
Message-ID: <20031201100842.GA3038@glorybox.de>
References: <20031130185807.GF7634@glorybox.de> <20031130212501.GO19217@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031130212501.GO19217@percy.comedia.it>
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
Date: Mon Dec  1 04:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

* Luca Berra <bluca@comedia.it>:

> >* why is vgscan reading /dev/cdrom (a link to my first IDE
> >CD-ROM /dev/hdc)?
> >
> >* how can I disable this message?
> 
> man lvm.conf

Done and and /etc/lvm/lvm.conf adjusted:
                                                                                
devices {
    dir = "/dev"
    scan = [ "/dev" ]
    filter = [ "r|cdrom|" ]
    cache = "/etc/lvm/.cache"
    write_cache_state = 1
}
                                                                                
vgscan still reports
"/dev/cdrom: open failed: Read-only file system"

I tried the following variants:
                                                                                
        filter = [ "r|/dev/cdrom" ]
        filter = [ "r|/dev/cdrom", "r|/dev/hdc" ]
        filter = [ "r|cdrom", "r|hdc" ]
                                                                                
Ideas? Kernel is 2.6.0-test9
                                                                                
LVM version:     2.00.07 (2003-09-16)
Library version: 1.00.05-ioctl-cvs (2003-09-01)
Driver version:  4.0.0
                                                                                
Kai
-- 
* mail kai.weber@glorybox.de . icq 102024972
  web http://www.glorybox.de . pgp 0x594D4132
