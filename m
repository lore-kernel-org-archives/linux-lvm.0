From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Data recovery from physical volumes?
Message-ID: <20030504022639.GB1445@guldukat>
References: <20030503233718.GB2009@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030503233718.GB2009@amphibian.dyndns.org>
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
Date: Sat May  3 20:24:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, 04.05.03, Toad <toad@amphibian.dyndns.org> wrote:
> Is there any way for me to recover (some of?) my data from LVM, given
> that LVM does not recognize my volume group, I have lost my /etc/lvm*,
> but I have the original physical volumes intact? Are there any tools I
> could use to do this? The LVM will be moderately fragmented...

Isn't vgscan supposed to do this? It creates /etc/lvmtab and /etc/lvmtab.d/*
according to its manpage.

After that call vgchange -ay and you should be up and going - if not, post
the full error message :)

hope that helps,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
