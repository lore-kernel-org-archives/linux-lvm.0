From: "Andy Francke" <afrancke@cisco.com>
Subject: RE: [linux-lvm] lvm2 and xfs (repost)
Message-ID: <NDBBJIIIAKLGEPBFEKBGIEGFGPAA.afrancke@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200306061044.50925.krienke@uni-koblenz.de>
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
Date: Fri Jun  6 04:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Is there anyone running lvm2 with xfs? If yes what configuration
> do you use?
> What kernel should I use to get both  working (in a stable fashion)?

Yes - read the archives to find a uuencoded patch patcher (I believe I
created it to patch DM's patch, but it might patch XFS's patch - I forget).
This is entirely unsupported and it may no longer work with recent DM or XFS
patchsets since I have not bothered to keep up with either DM or XFS since
my system (knock on wood) works.

Andy
