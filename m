From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] hmmm, curious... (OFFTOPIC)
Message-Id: <20020202113651.GB2380@colombina.comedia.it>
References: <25E4CA13D679FF48BC307694202209710164DEC1@nd1-clusa.local.bunnings.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25E4CA13D679FF48BC307694202209710164DEC1@nd1-clusa.local.bunnings.com.au>
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
Date: Sat Feb  2 05:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 31, 2002 at 09:11:13AM +0800, Colin Coe wrote:
> 
> Hi all, I have come accross a strange problem while doing some scripting
> with lvdisplay.  When I use lvdisplay piped to awk in the first example
> (noting that I have 'hard-wired' one field in awk), a second line is printed
> containing all hard-wired strings, including tabs.  But if I encase the
> lvdisplay in backticks and use echo then piped to awk the problem does not
> exist.
> 
command substitution (backticks if you whish) replaces all newlines with blanks
compresses sequences of blanks and trims trailing blanks
if you want only the first line in awk do:
lvdisplay -c /dev/rootvg/bbs | awk -F: 'NR==1 {print $1 "\t\t" $9 "\t" $9 "\t" "2" "\t" $4 }'

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
