From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
Message-ID: <20030819163419.H29420@uk.sistina.com>
References: <20030818222002.E29420@uk.sistina.com> <200308190000.h7J00Fo31973@mail.osdl.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <200308190000.h7J00Fo31973@mail.osdl.org>; from markw@osdl.org on Mon, Aug 18, 2003 at 05:00:12PM -0700
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
Date: Tue Aug 19 10:36:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: dm-devel@sistina.com

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 18, 2003 at 05:00:12PM -0700, markw@osdl.org wrote:
> On 18 Aug, Alasdair G Kergon wrote:
> > On Mon, Aug 18, 2003 at 02:09:18PM -0700, markw@osdl.org wrote:
> >> Ok, I increased the size of argv to 2048 in the dm-table.c file that's
> > 2048 is probably too big for the kernel stack.
> > Set it only as big as you need it.
> Yeah, I got greedy, 1024 worked for me. :)
 
Here's a patch to try that removes the hard-coded limit of 32.

(Plus one to fix the error message if you give a linear
target more than 2 arguments.)

Alasdair
-- 
agk@uk.sistina.com

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dm_argv.patch"

Remove hard-coded limit of 32 arguments per target.
--- linux-2.4.21/drivers/md/dm-table.c	Tue Jul  1 20:17:31 2003
+++ linux/drivers/md/dm-table.c	Tue Aug 19 15:43:50 2003
@@ -17,6 +17,7 @@
 #define NODE_SIZE L1_CACHE_BYTES
 #define KEYS_PER_NODE (NODE_SIZE / sizeof(sector_t))
 #define CHILDREN_PER_NODE (KEYS_PER_NODE + 1)
+#define MAX_TARGET_ARGS 64
 
 struct dm_table {
 	atomic_t holders;
@@ -443,10 +444,16 @@
 /*
  * Destructively splits up the argument list to pass to ctr.
  */
-static int split_args(int max, int *argc, char **argv, char *input)
+static int split_args(int *argc, char ***argvp, char *input)
 {
 	char *start, *end = input, *out;
+	char **argv;
+	int max_args = MAX_TARGET_ARGS;
+
 	*argc = 0;
+	argv = kmalloc(sizeof(*argv) * max_args, GFP_NOIO);
+	if (!argv)
+		return -ENOMEM;
 
 	while (1) {
 		start = end;
@@ -475,8 +482,20 @@
 		}
 
 		/* have we already filled the array ? */
-		if ((*argc + 1) > max)
-			return -EINVAL;
+		if ((*argc + 1) > max_args) {
+			char **argv2;
+			
+			max_args *= 2;
+			argv2 = kmalloc(sizeof(*argv2) * max_args, GFP_NOIO);
+			if (!argv2) {
+				kfree(argv);
+				return -ENOMEM;
+			}
+
+			memcpy(argv2, argv, sizeof(*argv) * *argc);
+			kfree(argv);
+			argv = argv2;
+		}
 
 		/* we know this is whitespace */
 		if (*end)
@@ -488,6 +507,7 @@
 		(*argc)++;
 	}
 
+	*argvp = argv;
 	return 0;
 }
 
@@ -495,7 +515,7 @@
 			sector_t start, sector_t len, char *params)
 {
 	int r = -EINVAL, argc;
-	char *argv[32];
+	char **argv;
 	struct dm_target *tgt;
 
 	if ((r = check_space(t)))
@@ -524,13 +544,14 @@
 		goto bad;
 	}
 
-	r = split_args(ARRAY_SIZE(argv), &argc, argv, params);
+	r = split_args(&argc, &argv, params);
 	if (r) {
-		tgt->error = "couldn't split parameters";
+		tgt->error = "couldn't split parameters (insufficient memory)";
 		goto bad;
 	}
 
 	r = tgt->type->ctr(tgt, argc, argv);
+	kfree(argv);
 	if (r)
 		goto bad;
 

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Description: dm_linear_errmsg.patch
Content-Disposition: attachment; filename="dm_linear_errmsg.patch"

Fix error message when linear targets gets handed more than 2 arguments.
--- linux-2.4.21/drivers/md/dm-linear.c	Fri Jul  4 18:56:24 2003
+++ linux/drivers/md/dm-linear.c	Tue Aug 19 16:09:38 2003
@@ -27,7 +27,7 @@
 	struct linear_c *lc;
 
 	if (argc != 2) {
-		ti->error = "dm-linear: Not enough arguments";
+		ti->error = "dm-linear: Invalid argument count";
 		return -EINVAL;
 	}
 

--8GpibOaaTibBMecb--
