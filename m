Subject: re: [linux-lvm] EVMS
Message-ID: <OFB151CBA0.060B695D-ON85256C23.006F1A6B@pok.ibm.com>
From: "Steve Pratt" <slpratt@us.ibm.com>
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
Date: Wed Aug 28 15:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: linux-lvm@sistina.com

>I know that the latest xfs release (March) does not support EVMS with RAID
5 sets.

>There may be other problems with the pairing as well.

We have doing quite a bit of testing and have not seen any other issues
with using the 2 together.

>Both the EVMS and XFS teams are working to get this supported in the next
release.  >(That looks to be a couple of months away.)

All the code has been checked into CVS for the repective projects.  EVMS
also has a patch available on our website for XFS 1.1 to allow the 2 to
work together properly.

 >>>  Hi all,

 >>>  I stumbled across something from IBM called EVMS today and was
 >>>  wondering if anyone had used it, and if so, what they thought of it?
 >>>  How does it differ from LVM?

 >>>  Here's the URL:

 >>>      http://oss.software.ibm.com/developerworks/opensource/evms

 >>>  It appears to be open source and is on Sourceforge as well.

 >>>  Thanks for any comments,
 >>>  --
