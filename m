From: "Stephen C. Tweedie" <sct@redhat.com>
Message-ID: <20011023113614.B2334@redhat.com>
References: <20011022153819.A2744@thunk.org> <001101c15b68$5adbb880$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001101c15b68$5adbb880$836788cf@industry>; from jlixfeld@fastvibe.com on Mon, Oct 22, 2001 at 10:13:48PM -0400
Subject: [linux-lvm] Re: What really works?
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
Date: Tue Oct 23 05:35:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason A. Lixfeld" <jlixfeld@fastvibe.com>
Cc: 'Theodore Tso' <tytso@mit.edu>, ext3-users@redhat.com, linux-lvm@sistina.com

Hi,

On Mon, Oct 22, 2001 at 10:13:48PM -0400, Jason A. Lixfeld wrote:

> This is still a very annoying problem.  chattr -i <-- I corrected it
> this time :)  Doesn't make the files or directories deletable.  Any
> other ideas?

Use "chattr -ia".  The "-a" (append-only) attribute will also pin the
files against deletion.

Failing that, "debugfs" lets you forcibly delete files: "clri
<filename>" will clear the inode by force, and a subsequent e2fsck
will fix up the fs summary information to be consistent with the
destroyed file (including deleting the directory entry pointing to the
nuked inode).

Cheers,
 Stephen
