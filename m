From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] problem resizing without losing data
Message-ID: <20011212084823.B13877@colombina.comedia.it>
References: <20011211115418.B27568@sistina.com> <20011211183257.23795.qmail@web9506.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011211183257.23795.qmail@web9506.mail.yahoo.com>; from sczjd@yahoo.com on Tue, Dec 11, 2001 at 10:32:57AM -0800
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
Date: Wed Dec 12 01:46:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SI Reasoning <sczjd@yahoo.com>
Cc: linux-lvm@sistina.com

On Tue, Dec 11, 2001 at 10:32:57AM -0800, SI Reasoning wrote:
> xfs and 3 is reiserfs. I recently attempted to shrink
> var by 500 meg and then expand usr by  500 meg. This
> hosed my system as many files in var were lost
> (although there was plenty of room to spare on var). 
did you shrink the /var filesystem before resizing the logical
volume ? I believe you didn't since there seems to be no way
to shrink an xfs filesystem.

regards,
L.

btw. it won't solve your problem, but since you are using cooker
could you try using newer lvm rpms from http://www.comedia.it/bluca/lvm/
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
