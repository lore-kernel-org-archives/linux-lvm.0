Received: from jeltz.chrissie.net (vpn-10-52.str.redhat.com [10.32.10.52])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1PDUKbm023989
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 08:30:21 -0500
Message-ID: <49A547EB.6020106@redhat.com>
Date: Wed, 25 Feb 2009 13:30:19 +0000
From: Chrissie Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd-corosync should check lksb.sb_status instead
	of	return code ?
References: <1cafab770902250235x39c180a4x63b9e5e6d9a761d5@mail.gmail.com>
In-Reply-To: <1cafab770902250235x39c180a4x63b9e5e6d9a761d5@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------010806020606040602060100"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------010806020606040602060100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Xinwei Hu wrote:
> Hi all,
> 
>   In clvmd-corosync, lock_resource calls dlm_ls_lock_wait with flags
> set to LKF_NOQUEUE.
>   When LKF_NOQUEUE is set, the return code of dlm_ls_lock_wait is
> always 0, while the actual errno is in lksb.sb_status.
> 
>   This causes problem when using vgchange -aey or something like.
> 
>   I attached a patch to try to fix this issue.
> 
>   Please help to review. Thanks.

Hi

You are correct, the functions do need to check the LKSB. Your patch
isn't quite right I don't think though - the lksb status should be
returned in errno as shown below:

-- 

Chrissie

--------------010806020606040602060100
Content-Type: text/x-patch;
 name="clvmd-corosync2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="clvmd-corosync2.diff"

Index: clvmd-corosync.c
===================================================================
RCS file: /cvs/lvm2/LVM2/daemons/clvmd/clvmd-corosync.c,v
retrieving revision 1.5
diff -u -p -r1.5 clvmd-corosync.c
--- clvmd-corosync.c	11 Feb 2009 10:13:20 -0000	1.5
+++ clvmd-corosync.c	25 Feb 2009 13:28:34 -0000
@@ -478,6 +478,12 @@ static int _lock_resource(const char *re
 		DEBUGLOG("dlm_ls_lock returned %d\n", errno);
 		return err;
 	}
+	if (lksb.sb_status != 0)
+	{
+		DEBUGLOG("dlm_ls_lock returns lksb.sb_status %d\n", lksb.sb_status);
+		errno = -lksb.sb_status;
+		return -1;
+	}
 
 	DEBUGLOG("lock_resource returning %d, lock_id=%x\n", err, lksb.sb_lkid);
 
@@ -504,6 +510,13 @@ static int _unlock_resource(const char *
 		DEBUGLOG("Unlock returned %d\n", err);
 		return err;
 	}
+	if (lksb.sb_status != 0)
+	{
+		DEBUGLOG("dlm_ls_unlock_wait returns lksb.sb_status: %d\n", lksb.sb_status);
+		errno = -lksb.sb_status;
+		return -1;
+	}   
+
 
 	return 0;
 }

--------------010806020606040602060100--
