From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] hmmm, curious...
Message-Id: <20020131114225.GB977@tykepenguin.com>
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
Date: Thu Jan 31 05:42:01 2002
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

If you're using lvdisplay in a script isn't using the -c switch easier than
parsing the text output ?

patrick
