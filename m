From: Kai Weber <lists@glorybox.de>
Subject: Re: [linux-lvm] vgscan messages regarding read-only cdrom
Message-ID: <20031202010341.GB884@glorybox.de>
References: <20031130185807.GF7634@glorybox.de> <20031130212501.GO19217@percy.comedia.it> <20031201100842.GA3038@glorybox.de> <20031201195526.GB4846@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031201195526.GB4846@localhost>
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
Date: Mon Dec  1 19:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

* Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>:

> It seems you can have just one instance of the "filter" directive, where
> you must put every filter you want to apply for devices. For example,
> this is what I have in my configuration file:
> filter = [ "r|hdd|", "r|cdrom|", "r|md|", "a|.*|" ]

Thank you for your help. This filter rule works as expected. As you
correctly noticed, the manpage is not clear about it.

Kai
-- 
* mail kai.weber@glorybox.de . icq 102024972
  web http://www.glorybox.de . pgp 0x594D4132
