From: Anders Widman <andewid@tnonline.net>
Message-ID: <1265620671.20020819224124@tnonline.net>
Subject: Re: [linux-lvm] accidently formatted a physical volume...
In-Reply-To: <284650000.1029786116@[192\.168\.200\.4]>
References: <20020819192319.GB25631@grimlock>
 <284650000.1029786116@[192.168.200.4]>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Aug 19 15:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Steven Lembark <linux-lvm@sistina.com>

>> Or, is there any way that I can fix/restore the formatted drive?

> Not at the *NIX level. If the data were SERIOUSLY valuable
> it can be recovered by physical means. Short of that I'd
> say it's time to reach for your tapes...

Are you sure? The data should be there in the co-worker did not make a
"full" (zeroing blocks) format. Is it not possible to restore the LVM
headers (or what it is called) on that drive?

- Anders

> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                             +1 800 762 1582

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
