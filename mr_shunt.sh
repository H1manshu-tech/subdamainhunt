#!/bin/bash

# --- SET YOUR PASSWORD HERE ---
CORRECT_PASSWORD="MrBlack@2026"

# --- COLOR DEFINITIONS ---
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# --- ATTEMPT 1 ---
clear
echo -e "${YELLOW}[?] System Security Notice: Protected by H-Secure Systems.${NC}"
read -sp "[-] Enter Authorization Password (Attempt 1/2): " USER_INPUT_PASS
echo ""

# Check First Attempt
if [ "$USER_INPUT_PASS" != "$CORRECT_PASSWORD" ]; then
    # --- SECOND ATTEMPT LAYER ---
    clear
    echo -e "${YELLOW}=====================================================================${NC}"
    echo -e "${YELLOW}⚠️⚠️⚠️  [!] WARNING: INVALID PASSWORD! ATTEMPT 1 FAILED  [!]  ⚠️⚠️⚠️${NC}"
    echo -e "${YELLOW}=====================================================================${NC}"
    echo -e "${RED}[!] Notice: You have only ONE last attempt remaining.${NC}"
    echo -e "${YELLOW}=====================================================================${NC}"
    echo ""
    
    read -sp "[-] Enter Authorization Password again (Attempt 2/2): " USER_INPUT_PASS_2
    echo ""
    
    # Check Second Attempt
    if [ "$USER_INPUT_PASS_2" != "$CORRECT_PASSWORD" ]; then
        # --- ALARM INTERFACE ON SECOND FAILURE ---
        clear
        echo -e "${RED}#####################################################################${NC}"
        echo -e "${RED}🚨🚨🚨 [!] CRITICAL ALARM: SECURITY BREACH DETECTED [!] 🚨🚨🚨${NC}"
        echo -e "${RED}#####################################################################${NC}"
        echo -e "${RED}[☠] STATUS       : Unauthorized Access Intrusion${NC}"
        echo -e "${RED}[☠] ACTION       : Emergency Lockout Activated (2/2 Attempts Failed)${NC}"
        echo -e "${RED}#####################################################################${NC}"
        exit 1
    fi
fi

# --- CONGRATULATIONS PANEL ---
clear
echo -e "${GREEN}=====================================================================${NC}"
echo -e "${GREEN}🎉🎉🎉 [✓] CONGRATULATIONS: AUTHENTICATION SUCCESSFUL [✓] 🎉🎉🎉${NC}"
echo -e "${GREEN}=====================================================================${NC}"
echo -e "${GREEN}[+] IDENTITY     : Verified Owner (Himanshu)${NC}"
echo -e "${GREEN}[+] PERMISSION   : Full Root System Privileges Granted${NC}"
echo -e "${GREEN}=====================================================================${NC}"
echo -e "${YELLOW}[*] Loading MrBlack 5-in-1 Subdomain Fusion Core...${NC}"
sleep 1.5

# =============================================================
# MAIN INTERFACE CONTROL
# =============================================================
clear
echo -e "${RED}███╗   ███╗${YELLOW}██████╗ ${GREEN}██████╗ ${CYAN}██╗      ${BLUE}█████╗  ${MAGENTA}██████╗${RED}██╗  ██╗${NC}"
echo -e "${RED}████╗ ████║${YELLOW}██╔══██╗${GREEN}██╔══██╗${CYAN}██║     ${BLUE}██╔══██╗${MAGENTA}██╔════╝${RED}██║ ██╔╝${NC}"
echo -e "${RED}██╔████╔██║${YELLOW}██████╔╝${GREEN}██████╔╝${CYAN}██║     ${BLUE}███████║${MAGENTA}██║     ${RED}█████╔╝ ${NC}"
echo -e "${RED}██║╚██╔╝██║${YELLOW}██╔══██╗${GREEN}██╔══██╗${CYAN}██║     ${BLUE}██╔══██║${MAGENTA}██║     ${RED}██╔═██╗ ${NC}"
echo -e "${RED}██║ ╚═╝ ██║${YELLOW}██║  ██║${GREEN}██████╔╝${CYAN}███████╗${BLUE}██║  ██║${MAGENTA}╚██████╗${RED}██║  ██╗${NC}"
echo -e "${RED}╚═╝     ╚═╝${YELLOW}╚═╝  ╚═╝${GREEN}╚═════╝ ${CYAN}╚══════╝${BLUE}╚═╝  ╚═╝${MAGENTA}╚═════╝ ${RED}╚═╝  ╚═╝${NC}"
echo -e "${GREEN}=============================================================${NC}"
echo -e "${GREEN}[+] Owner    : ${NC}Himanshu         ${GREEN}[+] Channel: ${NC}@MrBlackHackers"
echo -e "${GREEN}[+] Instagram: ${NC}h_secure_system  ${GREEN}[+] Engine : ${NC}5-in-1 Parallel Recon"
echo -e "${GREEN}=============================================================${NC}"
echo ""

# Interactive Target Prompt
echo -n -e "${CYAN}[?] Enter Target Website Domain (e.g., target.com): ${NC}"
read USER_INPUT_TARGET

if [ -z "$USER_INPUT_TARGET" ]; then
    echo -e "${RED}[!] Error: Target domain cannot be empty. Exiting...${NC}"
    exit 1
fi

# Sanitize domain string (remove protocols, slashes or www if entered)
DOMAIN=$(echo "$USER_INPUT_TARGET" | sed -e 's|^[^/]*//||' -e 's|/.*||' -e 's|^www\.||')
OUTPUT_DIR="mrblack_subs_$DOMAIN"
mkdir -p "$OUTPUT_DIR"

echo ""
echo -e "${GREEN}[✓] Target Engaged:${NC} $DOMAIN"
echo -e "${YELLOW}[*] Spawning 5 Independent Enumeration Threads in Background...${NC}"
echo "---------------------------------------------------------------------"

# --- DEPLOYING 5 ENGINES IN PARALLEL (&) ---

# Engine 1: Subfinder
echo -e "${CYAN}[⚙] Launching Engine-01:${NC} Subfinder passive scraper..."
subfinder -d "$DOMAIN" -silent -o "$OUTPUT_DIR/subfinder.txt" &
PID1=$!

# Engine 2: Assetfinder
echo -e "${CYAN}[⚙] Launching Engine-02:${NC} Assetfinder cert parser..."
assetfinder --subs-only "$DOMAIN" > "$OUTPUT_DIR/assetfinder.txt" &
PID2=$!

# Engine 3: Sublist3r
echo -e "${CYAN}[⚙] Launching Engine-03:${NC} Sublist3r search crawler..."
sublist3r -d "$DOMAIN" -n -o "$OUTPUT_DIR/sublist3r.txt" > /dev/null 2>&1 &
PID3=$!

# Engine 4: Amass
echo -e "${CYAN}[⚙] Launching Engine-04:${NC} Amass Active/Passive tracker (Fast mode)...${NC}"
amass enum -passive -d "$DOMAIN" -o "$OUTPUT_DIR/amass.txt" > /dev/null 2>&1 &
PID4=$!

# Engine 5: Knockpy
echo -e "${CYAN}[⚙] Launching Engine-05:${NC} Knockpy API integration analyzer..."
knockpy "$DOMAIN" --no-local --no-scan -o "$OUTPUT_DIR/knockpy_out" > /dev/null 2>&1 &
PID5=$!

echo ""
echo -e "${MAGENTA}[*] All threads active. Processing structural data matrices. Please wait...${NC}"

# --- LIVE PROGRESS MONITOR LOOP ---
# Loop tab tak chalega jab tak inme se koi bhi ek process background me active hai
while kill -0 $PID1 2>/dev/null || kill -0 $PID2 2>/dev/null || kill -0 $PID3 2>/dev/null || kill -0 $PID4 2>/dev/null || kill -0 $PID5 2>/dev/null; do
    echo -n -e "${RED}⚡${NC}"
    sleep 2
done
echo ""
echo -e "${GREEN}[✓] All 5 extraction threads executed successfully!${NC}"
echo "---------------------------------------------------------------------"

# --- PARSING AND MERGING DATA BLOCKS ---
echo -e "${YELLOW}[⚙] Merging and optimizing data inputs into ONE unified database...${NC}"

# Extracting clear domains from knockpy json output if generated
if [ -d "$OUTPUT_DIR/knockpy_out" ]; then
    cat "$OUTPUT_DIR/knockpy_out"/*.json 2>/dev/null | jq -r '.subdomain[]' 2>/dev/null >> "$OUTPUT_DIR/knockpy_clean.txt"
fi

# Combining all raw tools output into a single channel
cat "$OUTPUT_DIR/subfinder.txt" \
    "$OUTPUT_DIR/assetfinder.txt" \
    "$OUTPUT_DIR/sublist3r.txt" \
    "$OUTPUT_DIR/amass.txt" \
    "$OUTPUT_DIR/knockpy_clean.txt" 2>/dev/null \
    | grep -E "^[a-zA-Z0-9.-]+\.$DOMAIN$" \
    | sort -u > "$OUTPUT_DIR/final_subdomains.txt"

# Cleaning temporary raw individual files to keep workspace tidy
rm -f "$OUTPUT_DIR/subfinder.txt" "$OUTPUT_DIR/assetfinder.txt" "$OUTPUT_DIR/sublist3r.txt" "$OUTPUT_DIR/amass.txt" "$OUTPUT_DIR/knockpy_clean.txt" 2>/dev/null
rm -rf "$OUTPUT_DIR/knockpy_out" 2>/dev/null

TOTAL_UNIQUE_SUBS=$(wc -l < "$OUTPUT_DIR/final_subdomains.txt")

# =============================================================
# UNIFIED CENTRAL REPORT DISPLAY
# =============================================================
clear
echo -e "${GREEN}=====================================================================${NC}"
echo -e "${YELLOW}               [👑] UNIFIED RECONNAISSANCE MATRIX REPORT [👑]         ${NC}"
echo -e "${GREEN}=====================================================================${NC}"
echo -e "${GREEN}[ TARGET MASTER DOMAIN ] :${NC} $DOMAIN"
echo -e "${GREEN}[ DEPLOYED CORE ENGINES] :${NC} Subfinder | Assetfinder | Sublist3r | Amass | Knockpy"
echo -e "${GREEN}=====================================================================${NC}"
echo ""
echo -e "${CYAN}[✓] SINGLE ONE RESULT OVERVIEW:${NC}"
echo -e "${GREEN}[+] Total Unique Subdomains Extracted: ${NC}$TOTAL_UNIQUE_SUBS"
echo -e "${GREEN}[+] Consolidated Clean Database Path : ${RED}./$OUTPUT_DIR/final_subdomains.txt${NC}"
echo ""
echo -e "${GREEN}=====================================================================${NC}"
echo -e "${YELLOW}             Framework Execution Finished. Data Secured successfully.  ${NC}"
echo -e "${GREEN}=====================================================================${NC}"
